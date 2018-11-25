<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="../forms/formProducto.jsp"%>

<div class="content-inner">
	<!-- Page Header-->
	<header class="page-header">
		<div class="container-fluid">
			<h2 class="no-margin-bottom">producto</h2>
		</div>
	</header>
	<!-- Breadcrumb-->
	<div class="breadcrumb-holder container-fluid">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="../../Admin.jsp">Home</a></li>
			<li class="breadcrumb-item active">producto </li>
		</ul>
	</div>
	<section class="tables">
		<div class="container-fluid">
			<div class="card">
				<div class="card-header d-flex align-items-center">
					<h3 class="h4">Listado de productos</h3>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<jsp:useBean id="pDao" class="model.ProductoDao" scope="request"></jsp:useBean>
						<table class="table table-striped centered display" id="tablaProducto">
							<thead>
								<tr>
									<th>Id</th>
									<th>Nombre</th>
									<th>Descripcion</th>
									<th>Color</th>
									<th>Stock </th>
									<th>Imagen</th>
									<th>Precio</th>
									<th>Estado</th>
									<th>Categoria</th>
									<th>Marca</th>
									<th>Referencia</th>
									<th>Talla</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="producto" items="${pDao.list()}">
									<tr>
										<td><input type="hidden" id="${producto.id}" name="nit">
											<c:out value="${producto.id}" />
										</td>
										<td>
											<c:out value="${producto.nombreProducto}" />
										</td>
										<td>
											<c:out value="${producto.descripcionProducto}" />
										</td>
										<td>
											<c:out value="${producto.color}" />
										</td>
										<td>
											<c:out value="${producto.stock}" />
										</td>
										<td>
											<c:out value="${producto.imagen}" />
										</td>
										<td>
											<c:out value="${producto.precio}" />
										</td>
										<td>
											<c:out value="${producto.estado}" />
										</td>
										<td>
											<c:out value="${producto.categoria}" />
										</td>
										<td>
											<c:out value="${producto.marca}" />
										</td>
										<td>
											<c:out value="${producto.referencia}" />
										</td>
										<td>
											<c:out value="${producto.talla}" />
										</td>
										<td>
											<button type="button" data-toggle="modal" id="${producto.id}" data-target="#formActProducto" class="btn"
											 onclick="editarProducto(this)">
												<span class="fa fa-pencil"></span>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<section class="dashboard-counts">
	<!-- Modal Form-->
	<div class="col-lg-4">
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<h3 class="h4">Modal Form</h3>
			</div>
			<div class="card-body text-center">
				<button type="button" data-toggle="modal" data-target="#formActProducto" class="btn btn-primary">Actualizar
					producto
				</button>

				<!-- Modal-->
				<div id="formActProducto" tabindex="-1" role="dialog" aria-labelledby="formProductoLabel" aria-hidden="true"
				 class="modal fade text-left">
					<div role="document" class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h2 id="formProductoLabel" class="modal-title">Actualizar producto</h2>
								<button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
							</div>
							<div class="modal-body">
								<form method="post" action="productoServlet">
									<div class=" row justify-content-around">
										<!-- Columna izquierda -->
										<div class="col-md-6">
											<!-- NIT -->
											<div class="form-group">
												<label class="form-control-label">Id</label>
												<input type="text" name="id" class="form-control" id="modal_id" placeholder="Id">
											</div>
											<!-- nombre -->
											<div class="form-group">
												<label class="form-control-label">Nombre Producto</label>
												<input type="text" name="nombre" id="nombre" class="form-control" placeholder="Nombre" required>
											</div>
											<!-- Descripcion -->
											<div class="form-group">
												<label class="form-control-label">Descripcion</label>
												<input type="text" name="descripcion" id="descripcion" class="form-control" placeholder="Descripcion" required>
											</div>
											<!-- color -->
											<div class="form-group">
												<label class="form-control-label">color</label>
												<input type="text" name="color" id="color" class="form-control" placeholder="color">
											</div>
											
											<!-- stock -->
											<div class="form-group">
												<label class="form-control-label">stock</label>
												<input type="text" name="stock" id="stock" class="form-control" placeholder="color">
											</div>
										</div>

										<!-- Columna derecha -->
										<div class="col-md-6">
											<!-- contacto -->
											<div class="form-group">
												<label class="form-control-label"> Nombre contacto</label>
												<input type="text" name="nombreContacto" id="nombreContacto" class="form-control" placeholder="Contacto">
											</div>
											<!-- Telefono -->
											<div class="form-group">
												<label class="form-control-label">Teléfono contacto</label>
												<input type="text" name="telefono" id="telefono" class="form-control" placeholder="Telefono contacto">
											</div>
										</div>
									</div>
									<br>
									<div class="modal-footer">
										<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
										<button type="submit" class="btn btn-primary">Actualizar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- Boton para llamar al modal -->
<a href="#" class="btn btn-danger pull-right" data-toggle="modal" data-target="#formProducto"><strong>Registrar
		Producto</strong></a>