# Dino City Runner

Endless runner 3D para DescuentoM. Hecho con Godot 4.

## Controles
- Flecha izquierda / derecha: cambiar de carril
- Flecha arriba o Espacio: saltar

## Cómo empezar
1. Abre el proyecto en Godot 4
2. Crea una escena 3D (`Main.tscn`)
3. Añade un nodo `CharacterBody3D` y renómbralo a `Player`
4. Arrastra el script `scripts/player.gd` al nodo Player
5. Añade un `CollisionShape3D` y un `MeshInstance3D` (o CSGBox3D) como hijos
6. Añade una `Camera3D` como hijo del Player (colócala detrás y arriba)
7. Añade un suelo (`CSGBox3D` o `StaticBody3D`) largo en Z
8. Ejecuta la escena (F6)

## Estructura
```
scripts/
  player.gd    # Movimiento, salto y cambio de carril
```
