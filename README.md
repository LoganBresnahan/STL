## STL

### Necessary Dependencies
- Elixir 1.7

### Instructions to Run
- clone the repo
- cd into the repo
- run: `mix deps.get`
- run: `mix escript.build`
- run: `./stl Moon.stl`


### Test
- run: `mix test`

### Design Decisions

#### Why escript?
There is only one operation to handle and that is to take a file from the command line and run some calculations on its content. I see no reason to implement a supervised application that is managed by OTP unless this was meant to be an API that was used by other services.

#### Performance?
I've opted for simplicity. The script can take list of STL files and process them. For larger and more complex STL files (millions of facets) I would start thinking about spawning off a process for each STL file that is given from the CLI. I would also have to make sure that all of the recursion used here utilized tail call optimization (I usually just rely on erlang/elixir to be smart for me.)

#### Hex Packages
I use the Decimal dependency because it is a rock solid and accurate way of handling decimal calculations in Elixir. The only downside is, it produces some ugly code. Not using basic operators like + and * makes the code much longer.

#### Is this Math Right?
I don't really know. I'm not actually getting the surface area from each 3D triangle pyramid using the x, y, and z vertices. I have opted to just calculate a surface area from the vertices based on a 2D triangle which only utilized the x and y. For complete acuracy I think you would also have to take into account the facet normals for understanding which side(s) of the 3D triangle face outward in the final Moon structure.

Finding the minimum bouding box vertices also seems to be very complicated, and I have opted to not do it.

If I am over thinking how involved the calculations are please let me know. Rather than focusing on the acuracy of the math I hope you will focus on how the code is presented and structured.

Thanks again,
Logan