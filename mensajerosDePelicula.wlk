// mensajeros
object roberto {
  var vehiculo = camion
  
  method peso() = 90 + vehiculo.peso()
  
  method puedeLlamar() = false
  
  method asignarVehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }
}

object chukNorris {
  const peso = 80
  
  method peso() = peso
  
  method puedeLlamar() = true
}

object neo {
  var tieneCredito = true

  method cargarCredito() {
    tieneCredito = true
  }

  method llamar(){
    tieneCredito = false
  }
  
  method peso() = 0
  
  method puedeLlamar() = tieneCredito
} 

// vehículos

object bicicleta {
  var peso = 5
  
  method peso() = peso
}

object camion{
  var acoplados = 1
  var peso = acoplados * 500
  
  method peso() = peso
  
  method agregarAcoplados(unaCantidad) {
    acoplados = acoplados + unaCantidad
  }
} 

// destinos

object puenteDeBrooklyn {
  method puedePasar(mensajero) = mensajero.peso() <= 1000
}

object matrix {
  method puedePasar(mensajero) = mensajero.puedeLlamar()
}

 // paquetes

object paquete {
  var estaPagado = precio >= abonado
  var destino = matrix
  const precio = 50
  var abonado = 0

  method puedeSerEntregado(mensajero) { return self.estaPagado() and self.mensajeroPuedePasar(mensajero) }

  method mensajeroPuedePasar(mensajero){
    return destino.puedePasar(mensajero)
  }
  method abonar(cantidad){
    abonado = abonado + cantidad
  }

  method solicitarDestino(unDestino){
    destino = unDestino
  }

  method precio() = precio
  
  method estaPagado() = estaPagado


}

object paquetito {
   const precio = 0
   const estaPagado = true
   const puedeSerEntregado = true
   
   method precio() = precio
   method estaPagado() = estaPagado
   method puedeSerEntregado(mensajero) = puedeSerEntregado

}

object paquetonViajero {
   const destinos = []
   const estaPagado = abonado >= self.precio()
   var abonado = 0 
   const precio = destinos.size() * 100

   method solicitarDestino(destino) { destinos.add(destino)}

  method precio() = precio

  method puedeSerEntregado(mensajero) = self.estaPagado() and self.mensajeroPasaPorTodos(mensajero)
  
  method abonarPaquetes(cantidad) {abonado = abonado + cantidad}
  
  method mensajeroPasaPorTodos(mensajero) { return destinos.all({d => d.puedePasar(mensajero)})}
 
  method estaPagado() = estaPagado


}