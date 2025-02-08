# Assembly Tic-Tac-Toe Helper Functions

This repository contains assembly implementations of helper functions for a Tic-Tac-Toe game, written in ARM Thumb assembly.

## Overview

The functions implemented in this project assist in handling player moves and determining a winner in a Tic-Tac-Toe game. The functions operate on a `player_t` structure, which stores the player's moves in a bitmask format.
This is a project in my archive and would like to share with the world. 

## Functions

### `player_check_move_s`
```assembly
player_check_move_s FUNCTION  ; char player_check_move_s(player_t *player, int row, int col);
```
#### Description:
Checks whether a given move (row, column) has already been made by the player.
#### Parameters:
- `r0` - Pointer to the `player_t` structure
- `r1` - Row index
- `r2` - Column index
#### Return:
- `0x00` if the move is invalid (already taken)
- `0x01` if the move is valid

### `player_make_move_s`
```assembly
player_make_move_s FUNCTION  ; char player_make_move_s(player_t *player, int row, int col);
```
#### Description:
Attempts to mark the given position (row, column) as occupied by the player.
#### Parameters:
- `r0` - Pointer to the `player_t` structure
- `r1` - Row index
- `r2` - Column index
#### Return:
- `0x00` if the move is invalid (already taken)
- `0x01` if the move was successful

### `player_won_s`
```assembly
player_won_s FUNCTION  ; char player_won_s(player_t *player);
```
#### Description:
Checks if the player has won the game by comparing their move bitmask against winning patterns.
#### Parameters:
- `r0` - Pointer to the `player_t` structure
#### Return:
- `0x01` if the player has won
- `0x00` if the game is still ongoing

## Compilation & Usage

To compile and use these functions, you will need an ARM toolchain such as `arm-none-eabi-gcc` or an emulator that supports ARM assembly.

Example compilation command:
```bash
arm-none-eabi-as -o game_helpers.o game_helpers.s
```

## License
This project is licensed under the MIT License.

## Contributions
Feel free to submit issues or pull requests if you'd like to contribute or report bugs.

## Author
Developed by Divine Joseph Ciroma.

