# Wave_function_Collapse_algo
 An implementation of wave function collapse to create a connected maze using simple pipe pieces.

The algorithm works on the concept of entropy and how neighbouring cells are affected when a seed is placed in the maze.

Seed: The first central block is randomly picked from one of the 5 assets available

The seed will then add its neighbouring cells to a queue and then the queue will start getting executed.

The next executed block will add its neighbours untill the entrire board is filled.

Each block before being placed will check orientation of the previous ones and determine possible pieces that fit at runtime.


https://user-images.githubusercontent.com/90690107/230756811-0dae4fc3-0761-43f6-b9c7-8498d03b4b47.mp4

