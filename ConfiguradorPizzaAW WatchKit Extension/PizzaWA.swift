//
//  PizzaWA.swift
//  ConfiguradorPizzaAW
//
//  Created by Javier Hernando Lara Ospina on 20/03/16.
//  Copyright © 2016 BocachicoSE. All rights reserved.
//

import WatchKit

class PizzaWA: NSObject {
    let opcionesTamano = ["Pequeña", "Mediana", "Grande"]
    let opcionesMasa = ["Delgada", "Crujiente", "Gruesa"]
    let opcionesQueso = ["Mozarela", "Cheddar", "Parmesano", "Sin Queso"]
    let ingredientes = ["Jamon", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa", "Pollo"]
    
    var tamano: String? = nil
    var masa: String? = nil
    var queso: String? = nil

    var seleccionIngredientes = [false, false, false, false, false, false, false, false, false, false]
    
    func cuantosIngredientes () -> Int{
        var cuentaIngredientes = 0
        
        for i in seleccionIngredientes{
            if i {cuentaIngredientes++}
        }
        return cuentaIngredientes
    }
    
    func cambiarIngrediente(ingrediente: Int){
        let actual = seleccionIngredientes[ingrediente]
        if  actual {
            seleccionIngredientes[ingrediente] = false
        }else{
            seleccionIngredientes[ingrediente] = true
        }
    }
    
    func seleccionaIngrediente (nuevoIngrediente:String ){
        let ingrediente = ingredientes.indexOf(nuevoIngrediente)
        let cantidadIngredientes = cuantosIngredientes()
        if cantidadIngredientes < 5 {
            cambiarIngrediente(ingrediente!)
        }else{
            if seleccionIngredientes[ingrediente!]{
                cambiarIngrediente(ingrediente!)
            }
        }
        
    }
    
    func generaResumen() -> [String]{
        var resumen = ["  Tamaño", tamano!, "  Masa", masa!, "  Queso", queso!, "  Ingredientes"]
        for var i = 0; i < seleccionIngredientes.count; ++i {
            if seleccionIngredientes[i] {
                resumen.append(ingredientes[i])
            }
        }
        return resumen
        
    }
    
}
