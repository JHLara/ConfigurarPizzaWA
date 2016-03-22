//
//  CuartaInterfaceController.swift
//  ConfiguradorPizzaAW
//
//  Created by Javier Hernando Lara Ospina on 20/03/16.
//  Copyright © 2016 BocachicoSE. All rights reserved.
//

import WatchKit
import Foundation


class CuartaInterfaceController: WKInterfaceController {

    @IBOutlet var myTable: WKInterfaceTable!
    
    @IBOutlet var siguienteBotonOutlet: WKInterfaceButton!

    var datosPizza = PizzaWA()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        datosPizza = context as! PizzaWA
        cargarTabla()
        habilitaBoton()
        
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
        let datos = datosPizza.ingredientes
        myTable.setNumberOfRows(datos.count, withRowType: "cuartaTable")
        for var i = 0; i < datos.count; ++i {
            if let row = myTable.rowControllerAtIndex(i) as? RowController {
                row.etiqueta.setText(datos[i])
                row.etiqueta.setTextColor(defineColor(i))
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let ingredienteSeleccionado = datosPizza.ingredientes[rowIndex]
        datosPizza.seleccionaIngrediente(ingredienteSeleccionado)
        for var i = 0; i < datosPizza.seleccionIngredientes.count; ++i {
            if let row = myTable.rowControllerAtIndex(i) as? RowController {
                row.etiqueta.setTextColor(defineColor(i))
            }
        }
        habilitaBoton()
    }
    
    func defineColor (indice: Int) -> UIColor{
        if datosPizza.seleccionIngredientes[indice]{
            return UIColor.blueColor()
        }else{
            return UIColor.whiteColor()
        }
    }
    
    func habilitaBoton(){
        if datosPizza.cuantosIngredientes() == 0 {
            siguienteBotonOutlet.setEnabled(false)
        }else{
            siguienteBotonOutlet.setEnabled(true)
        }
    }

    @IBAction func siguienteBoton() {
        self.pushControllerWithName("quinta", context: datosPizza)

    }
}
