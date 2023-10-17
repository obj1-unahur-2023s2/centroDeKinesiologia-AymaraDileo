class Paciente {
	
    const property edad
	var nivelDeFortaleza 
	var nivelDeDolor 
	const rutina = []

    method nivelDeFortaleza() = nivelDeFortaleza
    method nivelDeDolor() = nivelDeDolor
	
	method nivelDeFortaleza(cantidad){
		nivelDeFortaleza += cantidad
	}
	
	method nivelDeDolor(cantidad){
		nivelDeDolor = 0.max(nivelDeDolor-cantidad)
	}
	
	method puedeUsar(aparato){
		return aparato.puedeSerUsado(self)
	}
	
	method usarAparato(aparato){
	    return aparato.usar(self)
	}
	 method realizarRutina(){
	 	rutina.forEach({r=>r.usar(self)})
	 }
	 method puedeRealizarRutina(){
	 	return rutina.all({r=>r.puedeSerUsado(self)})
	 }
	 method agregarAparatos(aparatos){
         rutina.addAll(aparatos)	 	
	 }
}


class Magneto{
	
	method usar(paciente){
		paciente.nivelDeDolor(paciente.nivelDeDolor() *0.1)	
	}
	method puedeSerUsado(paciente){
		return true
	}
}

class Bicicleta{
	
	method usar(paciente){
		if (not self.puedeSerUsado(paciente))
		  self.error("No puede ser usado") 
		paciente.nivelDeDolor(4)
		paciente.nivelDeFortaleza(3)	
	}
	method puedeSerUsado(paciente){
		return paciente.edad()>8
	}
}

class Minitramp{
	
	method usar(paciente){
		if (not self.puedeSerUsado(paciente))
		  self.error("No puede ser usado") 
		paciente.nivelDeFortaleza(paciente.edad()*0.1)
	}
	method puedeSerUsado(paciente){
		return paciente.nivelDeDolor() < 20
	}
}