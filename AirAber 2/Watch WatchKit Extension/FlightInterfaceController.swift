//
//  FlightInterfaceController.swift
//  Watch WatchKit Extension
//
//  Created by student on 9/23/22.
//  Copyright © 2022 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {

  @IBOutlet var flightLabel: WKInterfaceLabel!
    
    
    @IBOutlet weak var routeLabel: WKInterfaceLabel!
   
    @IBOutlet weak var boardingLabel: WKInterfaceLabel!
    
   
    @IBOutlet weak var boardingTimeLabel: WKInterfaceLabel!
    
 
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    
 
    @IBOutlet weak var gateLabel: WKInterfaceLabel!
   
    @IBOutlet weak var seatLabel: WKInterfaceLabel!
    
  
    var flight: Flight? {
      didSet {
        guard let flight = flight else { return }

        flightLabel.setText("Flight \(flight.shortNumber)")
        routeLabel.setText(flight.route)
        boardingLabel.setText("\(flight.number) Boards")
        boardingTimeLabel.setText(flight.boardsAt)

        if flight.onSchedule {
          statusLabel.setText("On Time")
        } else {
          statusLabel.setText("Delayed")
          statusLabel.setTextColor(.red)
        }

        gateLabel.setText("Gate \(flight.gate)")
        seatLabel.setText("Seat \(flight.seat)")
      }
    }

    override func awake(withContext context: Any?) {
      super.awake(withContext: context)

      flight = Flight.allFlights().first
    }
  }
