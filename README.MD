# Bluesoft Bank

Bluesoft Bank es un sistema bancario digital diseñado para facilitar la gestión eficiente de cuentas de ahorro y cuentas corrientes para una amplia gama de usuarios, incluyendo tanto personas naturales como empresas. Este proyecto busca modernizar y simplificar las operaciones bancarias, ofreciendo una plataforma robusta y segura para la realización de transacciones financieras, consulta de saldos, movimientos recientes y la generación de extractos mensuales.

## Mapeo de URLs y Funcionalidades

A continuación se detalla la relación entre las URLs de la aplicación y las funcionalidades que proporcionan:

- **Página Principal:** `GET /` - Muestra la vista principal de la aplicación.
- **Registro:** `GET /register` - Muestra el formulario de registro para nuevos usuarios.
- **Inicio de Sesión:** `GET /login` - Muestra el formulario de inicio de sesión para usuarios existentes.
- **Perfil de Usuario:** `GET /profile` - Muestra el perfil del usuario autenticado, accesible solo tras el inicio de sesión.
- **Agregar Cuenta:** `POST /add_account` - Permite al usuario autenticado agregar una nueva cuenta bancaria.
- **Consultar Transacciones:** `GET /get_transactions` - Permite al usuario autenticado consultar las transacciones de sus cuentas.
- **Crear Cliente:** `POST /create-client` - Endpoint para la creación de un cliente dentro de la aplicación.
- **Inicio de Sesión de Usuario:** `POST /login_user` - Procesa el inicio de sesión del usuario.
- **Cerrar Sesión:** `GET /logout` - Cierra la sesión del usuario autenticado.
- **Retirar Dinero:** `POST /withdrawMoney` - Permite al usuario autenticado realizar un retiro de dinero de una cuenta específica.

Cada una de estas rutas está diseñada para proporcionar una interfaz clara y funcionalidades específicas dentro de la aplicación, asegurando una experiencia de usuario fluida y segura.

## Tecnologías Utilizadas

- **Backend:** Django 5.0.3, Django REST Framework para una API robusta y escalable.
- **Base de Datos:** SQLite para desarrollo y PostgreSQL para producción, facilitando la gestión eficiente de transacciones y la integridad de los datos.
- **Seguridad:** Implementación de JWT para la autenticación y manejo seguro de sesiones.

## Instalación y Configuración

### Requisitos Previos

Asegúrese de tener Python 3.8 o superior y pip instalados en su sistema.

### Pasos de Instalación

1. **Clonar el Repositorio:**
   ```bash
   git clone https://github.com/AndresDFX/bluesoft-bank.git
   cd bluesoft-bank

2. **Instalar dependencias**
    ```bash
    pip install -r requirements.txt

3. **Migraciones**
    ```bash
    python manage.py migrate

4. **Data inicial**

    Se puede cargar el dump.sql o cargar el fixture
    ```bash
    python manage.py loaddata initial_data.json

5. **iniciar servidor**
    ```bash
    python manage.py runserver


## Usuarios Predeterminados
# Admin:
- Username: admin
- Password: admin

# Cliente:
- Username: cliente@example.com
- Password: cliente#