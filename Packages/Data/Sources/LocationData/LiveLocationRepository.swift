//
//  LiveLocationRepository.swift
//  LocationData
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine
import CommonDomain
import CoreLocation
import LocationDomain

public final class LiveLocationRepository: NSObject, LocationRepository, CLLocationManagerDelegate {
    
    internal var locationPublisher: PassthroughSubject<UserLocation, LocationError>!
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    public func getUserLocation() -> AnyPublisher<UserLocation, LocationError> {
        locationPublisher = PassthroughSubject<UserLocation, LocationError>()
        
        let status = getPermissionStatus(from: locationManager)
        switch status {
        case .authorized:
            locationManager.requestLocation()
            
            return locationPublisher
                .eraseToAnyPublisher()
        case .denied:
            return Fail<UserLocation, LocationError>(error: LocationError.userDeniedRequest)
                .eraseToAnyPublisher()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
            return locationPublisher
                .eraseToAnyPublisher()
        case .unknown:
            return Fail<UserLocation, LocationError>(error: LocationError.unknownPermissionState)
                .eraseToAnyPublisher()
        }
    }
    
    internal func getPermissionStatus(from manager: CLLocationManager) -> LocationPermission {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            .authorized
        case .denied, .restricted:
            .denied
        case .notDetermined:
            .notDetermined
        @unknown default:
            .unknown
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            locationPublisher.send(completion: .failure(LocationError.failedToObtainLocation))
            return
        }
        
        let userLocation = UserLocation(
            coordinate: GeographicCoordinate(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude))
        
        locationPublisher.send(userLocation)
        locationPublisher.send(completion: .finished)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        locationPublisher.send(completion: .failure(LocationError.failedToObtainLocation))
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = getPermissionStatus(from: locationManager)
        switch status {
        case .authorized:
            manager.requestLocation()
        case .denied:
            locationPublisher.send(completion: .failure(LocationError.userDeniedRequest))
        case .notDetermined:
            // Authorization request is in progress
            break
        case .unknown:
            locationPublisher.send(completion: .failure(LocationError.unknownPermissionState))
        }
    }
}
