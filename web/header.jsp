<%@page import="edu.uanl.fcfm.lmad.papw.dao.CategoriaDAO"%>
<%@page import="edu.uanl.fcfm.lmad.papw.model.Categoria"%>
<%@page import="java.util.ArrayList"%>
<div id="header">
    <form action="anuncios.jsp" method="get">
        <ul class="inline">
            <div id="searchBar" style="display: inline;">
                <li><input type="text" name="parametro" value="Buscar..." 
                    onclick="if(this.value === 'Buscar...'){this.value='';}" 
                    onfocus="if(this.value === 'Buscar...'){this.value='';}" 
                    onblur="if(this.value === '') { this.value='Buscar...';}"/>
                </li>
            </div>
            <div id="searchDate" style="display: none;">
                <li>Desde: <input type="date" name="fechaInicio" id="fechaInicio"/></li>
                <li> hasta: <input type="date" name="fechaFin" id="fechaFin"/></li>
            </div>
            <li>
                 en 
                 <select name="criterio" onchange="searcher()" id="selectSearch">
                    <option value="todos">Todos</option>
                    <option value="productos">Productos</option>
                    <option value="usuarios">Usuarios</option>
                    <option value="fecha">Fecha</option>
                </select>
            </li>
            <li><input type="submit" value="Buscar"/></li>
        </ul>
    </form>
    <script>
        function searcher()
        {
            Date.prototype.toDateInputValue = (function() {
                var local = new Date(this);
                local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
                return local.toJSON().slice(0,10);
            });
            if (document.getElementById("selectSearch").value === "fecha")
            {
                document.getElementById("searchBar").style.display = 'none';
                document.getElementById("searchDate").style.display = 'inline';
                document.getElementById('fechaInicio').value = new Date().toDateInputValue();
                document.getElementById('fechaFin').value = new Date().toDateInputValue();
            }
            else
            {
                document.getElementById("searchBar").style.display = 'inline';
                document.getElementById("searchDate").style.display = 'none';
            }
        }
    </script>
</div>

<div id="main_content">

    <div id="menu" class="inline_block">

        <div id="logo">
            <h1><a href="index.jsp">VENTASLMAD</a></h1>
        </div>

        <div id="session">
        <%
            if (session.getAttribute("username") == null)
            {
        %>
        <h2>Iniciar sesión</h2>
            <form method="post" action="login">
                <input type="text" name="nickname" value="usuario"
                       onclick="if(this.value === 'usuario'){this.value='';}" 
                       onfocus="if(this.value === 'usuario'){this.value='';}" 
                       onblur="if(this.value === '') { this.value='usuario';}"/>
                <input type="text" name="password" value="contraseña"
                       onclick="if(this.value === 'contraseña')
                           {this.value=''; this.type='password';}" 
                        onfocus="if(this.value === 'contraseña')
                           {this.value=''; this.type='password';}"
                       onblur="if(this.value === '') 
                           { this.value='contraseña'; this.type='text';}"/>
                <input type="submit" value="Entrar">  <a href="registro.jsp" >Registrarse</a>
            </form>
        <%
            }
            else
            {
        %>
            <h2>Bienvenido, <%= (String)session.getAttribute("username") %></h2>
            <ul>
                <li><a href="listaProductos.jsp">Mis productos</a></li>
                <li><a href="nuevoProducto.jsp">Registrar producto</a></li>
                <li><a href="listaCompras.jsp">Mis compras</a></li>
                <li><a href="editarUsuario.jsp">Editar cuenta</a></li>
                <li><a href="index.jsp?logout=true">Cerrar sesión</a></li>
            </ul>
        <%
            }
        %>                
        </div>

        <div id="categories">
            <h2>Categorías</h2>
            <ul>
            <%
                List<Categoria> categorias = new ArrayList<Categoria>(CategoriaDAO.getCategorias());
                if (categorias != null) 
                {
                    String categoriaTemp = null;
                    for (Categoria c : categorias)
                    {
                        String categoria = c.getCategoria();
                        if(!categoria.equals(categoriaTemp))
                        {
                            categoriaTemp = categoria;
            %>
                <li class="titulo"><a href="anuncios.jsp?categoria=<%= categoriaTemp %>">
                        <%= categoriaTemp %></a></li>
                <li><a href="anuncios.jsp?subcategoria=<%= c.getSubcategoria() %>">
                        <%= c.getSubcategoria() %></a></li>
            <%
                        }
                        else
                        {
            %>
                <li><a href="anuncios.jsp?subcategoria=<%= c.getSubcategoria() %>">
                        <%= c.getSubcategoria() %></a></li>
            <%
                        }
                    }
                }
            %>
            </ul>
        </div>
    </div>