//
//  SegundaInterfaceController.swift
//  ConfiguradorPizzaAW
//
//  Created by Javier Hernando Lara Ospina on 20/03/16.
//  Copyright © 2016 BocachicoSE. All rights reserved.
//

import WatchKit
import Foundation


class SegundaInterfaceController: WKInterfaceController {

    @IBOutlet var myTable: WKInterfaceTable!
    var datosPizza = PizzaWA()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        datosPizza = context as! PizzaWA
        cargarTabla()
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func cargarTabla(){
        let datos = datosPizza.opcionesMasa
        myTable.setNumberOfRows(datos.count, withRowType: "segundaTable")
        for var i = 0; i < datos.count; ++i {
            if let row = myTable.rowControllerAtIndex(i) as? RowController {
                row.etiqueta.setText(datos[i])
                if datos[i] == datosPizza.masa {
                    row.etiqueta.setTextColor(UIColor.blueColor())
                }
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        datosPizza.masa = datosPizza.opcionesMasa[rowIndex]
        self.pushControllerWithName("tercera", context: datosPizza)
    }

}
