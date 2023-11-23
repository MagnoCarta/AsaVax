# AsaVax

## Review da Arquitetura

- **Project**: Raiz do projeto;
	- **Shared**: Aquivods que serão usados por todos os targets;
		- App: Configuração e inicialização do App;
		- **Services**: Serviços que serão consumidos pelas ViewModels;
		- **Utils**
			- **Protocols**: Protocolos que pertecem a mais de uma feature;
			- **Components**: Componentes que pertecem a mais de uma feature;
			- **Extensions**: Classes/Struct nativas extendidas;
			- **Helpers/Managers**: Classes/Structs/etc que abstraem alguma computação e que serão usadas por outro construtos do sistema;
				- LoggerManager, ErrorManager, CalendarHelper...
			- **Styles**: Novos estilos do SwiftUI para o sistema;
			- **Modifiers**: Novos SwiftUI modifiers for the system;
		- **Model** or **GlobalModels**: Entities/Models que pertencem a mais de uma feature.
		- **Resources**: Recursos alem de classes e structs
			- String Catalogs, JSON files, image sets, color sets...
	- **iOS**: platform specific structures;
		- **Features**: Functionalidades/Fluxo do Sistema;
			- *FeatureA*
				- **Components**: Componentes da feature;
				- **Model**: Modelo da feature;
				- **View**: View da feature;
				- **ViewModel**: ViewModel da feature;
				- **Coordinator**: class responsavel pela navegação;

