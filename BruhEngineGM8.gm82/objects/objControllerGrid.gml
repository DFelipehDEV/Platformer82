#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Event


var grid_width;
grid_width = room_width / cell_size;
var grid_height;
grid_height = room_height / cell_size;
global.collision_grid = ds_grid_create(grid_width, grid_height);
var i, j;
for (i = 0; i < grid_width; i += 1)
{
    for (j = 0; j < grid_height; j += 1)
    {
        var cell_x;
        cell_x = i * cell_size;
        var cell_y;
        cell_y = j * cell_size;
        var cell_width;
        cell_width = cell_size;
        var cell_height;
        cell_height = cell_size;
        if (place_meeting(cell_x, cell_y, parTerrain))
        {
            ds_grid_set(global.collision_grid, i, j, 1);
        }
        else
        {
            ds_grid_set(global.collision_grid, i, j, 0);
        }
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Grids
