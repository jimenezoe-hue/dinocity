# Dino City Runner

Endless runner 3D para DescuentoM — Godot 4.

## Controles
- ← → : cambiar de carril
- ↑ o Espacio : saltar

## Debug
- **F1** : invencible
- **F2** : velocidad x2
- **F3** : velocidad normal

## Estructura
```
scripts/
  player.gd       # Dino: movimiento, salto, estados
  game_manager.gd # Puntuación y estado del juego
  object_pool.gd  # Pool de obstáculos e ítems
  spawner.gd      # Generador de obstáculos
scenes/
  main.tscn       # Escena principal
```

## Cómo probar
1. Abre el proyecto en Godot 4
2. Abre `scenes/main.tscn`
3. Presiona F6
