component displayname="Factory" { 
	/*
	* Função: Construtor
	* @name init
	* @return void
	*/
	public function init() { 
		variables.controller	= structNew();
		variables.services		= structNew();
		variables.DAO			= structNew();
		variables.model			= structNew();
		variables.lib			= structNew();
		
		return this; 
	}
	
	/*
	* Factory que retorna uma instancia de um objeto DAO
    * @name getDAO
    * @return
	*/
	public function getDAO(required string class){
		
		//verifica se já existe essa instância, caso contrário cria a mesma
		if( StructKeyExists( variables.DAO, arguments.class ) == false ) {
			variables.DAO[ arguments.class ] = this.createDAO( class : arguments.class );
		}

		return variables.DAO[ arguments.class ];
		
	}
	
	/*
	* Factory que cria uma instancia de um objeto DAO
	* @name createDAO
	* @return
	*/
	public function createDAO(required string class){
		
		return CreateObject( "component" , arguments.class ).init();
		
	}
	
	/*
	* Factory que retorna uma instancia de um objeto Service
	* @name getService
	* @return
	*/
	public function getService(required string class){
	
		//verifica se já existe essa instância, caso contrário cria a mesma
		if( StructKeyExists( variables.services, arguments.class ) == false ) {
			variables.services[ arguments.class ] = this.createService( class : arguments.class );
		}

		return variables.services[ arguments.class ];	
	
	}
	
	/*
	* Factory que cria uma instancia de um Service
	* @name createService
	* @return
	*/
	public function createService(required string class){
		
		return CreateObject( "component" , arguments.class ).init();
		
	}
	
	/*
	* Factory que retorna uma instancia de um objeto Controller
	* @name getController
	* @return
	*/
	public function getController(required string class, boolean hasConstructor=true){
		
		return this.createController( class : arguments.class , hasConstructor : arguments.hasConstructor );
		
	}
	
	/*
	* Factory que cria uma instancia de um objeto Controller
	* @name createController
	* @return
	*/
	public function createController(required string class, boolean hasConstructor=true){
		
		local.classInstance = "";

			if(arguments.hasConstructor) {
			local.classInstance = CreateObject( "component" , arguments.class ).init();
		}
		else {
			local.classInstance = CreateObject( "component" , arguments.class );
		}

		return local.classInstance;
		
	}
	
	/*
	* Factory que retorna uma instancia de um objeto Model
	* @name getModel
	* @return
	*/
	public function getModel(required string class, boolean hasConstructor=true){
		
		return this.createModel( class : arguments.class , hasConstructor : arguments.hasConstructor );
		
	}
	
	/*
	* Factory que cria uma instancia de um objeto Model
	* @name createModel
	* @return
	*/
	public function createModel(required string class, boolean hasConstructor=true){
		
		local.classInstance = "";

		if(arguments.hasConstructor) {
			local.classInstance = CreateObject( "component" , arguments.class ).init();
		}
		else {
			local.classInstance = CreateObject( "component" , arguments.class );
		}

		return local.classInstance;
		
	}
}