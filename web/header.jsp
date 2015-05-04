<ul class="inline">
    <li><input type="text" value="Buscar..." onclick="this.value=''"
               onblur="if(this.value === '') { this.value='Buscar...';}"/></li>
    <li><input type="submit" /></li>
</ul>
</div>

<div id="main_content">

<div id="menu" class="inline_block">

    <div id="logo">
        <h1><a href="Index">VENTASLMAD</a></h1>
        <h2>Juegos y más juegos para los frikis de hoy y siempre</h2>
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
            <input type="submit">
            <input type="reset">
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
            <li><a href="#">Detalles</a></li>
            <li><a href="Index?logout=true">Cerrar sesión</a></li>
        </ul>
    <%
        }
    %>                
    </div>

    <div id="categories">
        <h2>Categorías</h2>
        <ul>
        <%
            List<String> categorias = (List<String>)
                session.getAttribute("categorias");
            if (categorias != null) 
            {
                String categoriaTemp = null;
                for (String cat : categorias)
                {
                    String subcategoria = cat.substring(cat.indexOf(",") + 1);
                    String categoriaString = cat.substring(0, cat.indexOf(","));
                    if(!categoriaString.equals(categoriaTemp))
                    {
                        categoriaTemp = categoriaString;
        %>
            <li class="titulo"><a href="categoria?categoria=<%= categoriaTemp %>">
                    <%= categoriaTemp %></a></li>
            <li><a href="categoria?subcategoria=<%= subcategoria %>"><%= subcategoria %></a></li>
        <%
                    }
                    else
                    {
        %>
            <li><a href="categoria?subcategoria=<%= subcategoria %>"><%= subcategoria %></a></li>
        <%
                    }
                }
            }
        %>
        </ul>
    </div>
</div>