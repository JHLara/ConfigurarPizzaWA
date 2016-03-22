//
//  PrimeraInterfaceController.swift
//  ConfiguradorPizzaAW
//
//  Created by Javier Hernando Lara Ospina on 21/03/16.
//  Copyright © 2016 BocachicoSE. All rights reserved.
//

import WatchKit
import Foundation

class PrimeraInterfaceController: WKInterfaceController {

    @IBOutlet var myTable: WKInterfaceTable!
    var datosPizza = PizzaWA()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if let _ = context as? PizzaWA {
            datosPizza = context as! PizzaWA
        }
    }

    override func willActivate() {
        super.willActivate()
        cargarTabla()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func cargarTabla(){
        let datos = datosPizza.opcionesTamano
        myTable.setNumberOfRows(datos.count, withRowType: "primeraTable")
        for var i = 0; i < datos.count; ++i {
            if let row = myTable.rowControllerAtIndex(i) as? RowController {
                row.etiqueta.setText(datos[i])
                if datos[i] == datosPizza.tamano {
                    row.etiqueta.setTextColor(UIColor.blueColor())
                }
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
            datosPizza.tamano = datosPizza.opcionesTamano[rowIndex]
            self.pushControllerWithName("segunda", context: datosPizza)
    }
}
