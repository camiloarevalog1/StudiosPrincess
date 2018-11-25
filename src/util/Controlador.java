package util;

import java.util.Date;
import java.util.List;
import entities.Usuario;
import model.GenericDao;
import model.UsuarioDao;

public class Controlador {

	
	
	
	
	
	
	public boolean login(String nombre,String password){
		System.out.println("juancho");
		GenericDao<Usuario> usDao= new UsuarioDao();
		Usuario us= usDao.find(nombre);
		System.out.println(us);
		System.out.println("1234");
		if(us == null){
			System.out.println("jua");
			return false;
		}
		
		else if(us.getNombre().equals(nombre) && us.getClave().equals(password)){
			System.out.println("juan");
			return true;
		}else {
			System.out.println("juanch");
			return false;
		}
		
		
	}
	
	public Usuario buscarUsuario(String nombre) {
			
			GenericDao<Usuario> us= new UsuarioDao();
			Usuario u = us.find(nombre);
			return u;
	}
	
	
	
}
