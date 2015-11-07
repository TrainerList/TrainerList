class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/perfil/logar")
        //"/"(view:"/index")
        "500"(view:'/error')
	}
}
