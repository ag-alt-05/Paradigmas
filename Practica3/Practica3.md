# Reporte: Instalación de Haskell y Aplicación TODO

**Nombre:** [Guzmán Ramírez Carlos Alberto]  
**Materia:** [Paradigmas de la programacion]  
**Fecha:** [02/05/2026]

## 1. Instalación del Entorno de Desarrollo

### 1.1 Instalación de GHCup

Para instalar Haskell en Windows se utilizó GHCup. Desde el Powershellse ejecutó el siguiente comando:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { & ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -Interactive -DisableCurl } catch { Write-Error $_ }
```
[Intalación](instalacion.jpg)

Posterior a eso tuve que seleccionar el directorio al que iria la instalacion y aceptar los paquetes que serian instalados:

| Componente | Descripción |
- **GHC**: El compilador principal de Haskell.
- **Cabal**: Herramienta de construcción y empaquetado.
- **Stack**: Manejador de proyectos y dependencias.
- **HLS**: Servidor de lenguaje para asistencia en el editor.
- **MSYS2**: Herramientas necesarias en Windows para compilar dependencias nativas.!

[Aceptación](aceptacion.jpg)


### 1.2 Verificacion de instalacion

Para verificar la instalacion de *ghc*, *cabal* y *stack* se tuvo que realizar las siguientes
lineas de comandos:  
- **GHC**: ghc --version
- **Cabal**: cabal --version
- **Stack**: stack --version
[Verificación](verificacion.jpg)

## 2. Crear archivo Haskell

### 2.1 Probar GHCI

En esta parte solo imprimi un par de mensajes y ya, al igual que una suma y el reverse
[Pruebación](pruebacion.jpg)


### 2.2 Crear archivo

Se creo un archivo Haskell con el nombre "pruebaHaskell.hs"
[Copilación](copilacion.jpg)

- Se añadio el código: 
    **module Main where**
    **main :: IO ()** 
    **main = putStrLn "Hola, si funciono"**
    Para que pudiera copilar
- Con **ghc (nombre del archivo)** se copila al **.exe**
- Y para ejecutar se hace de una forma muy similar a los .C con **.\(nombre del archivo)**
- A la hora de ejecutar la salida esperada "Hola, si funciono" salio exitosamente

## 3. Aplicación TODO en Haskell

### 3.1 Descripción general
La aplicación TODO permite gestionar tareas pendientes de forma sencilla:

- Escribir **cualquier palabra** → Agrega una nueva tarea
- **items** → Listar todas las tareas
- **quit** → Salir de la aplicación

### 3.2 Estructura del código

El código utiliza conceptos clave de Haskell:

- **Ciclos** (*loop* se llama a sí misma)
- **Inmutabilidad** (se crea una nueva lista con *tareas ++ [linea]*)
- **Funciones de orden superior** (*zipWith, mapM_*)


- **Para procesar los comandos del usuario en un programa que hace listas:**

```haskell
main = loop []

loop tareas = do
    putStr "> "
    linea <- getLine
    if linea == "quit"
        then putStrLn "Adios"
        else if linea == "items"
            then mapM_ putStrLn (zipWith (\i t -> show i ++ ". " ++ t) [1..] tareas) >> loop tareas
            else loop (tareas ++ [linea])
```
- **Ejecución:**
[Ejecución](ejecucion.jpg)