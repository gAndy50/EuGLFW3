without warning

include glfw3.e

public constant GL_TRUE = 1,
		GL_FALSE = 0

atom win

atom gl = glfwInit()

if gl = -1 then
	puts(1,"Could not init EuGLFW3!\n")
	abort(0)
end if

win = glfwCreateWindow(800,600,"My Window",0,0)

if win = -1 then
	puts(1,"Could not create Window!\n")
	abort(0)
end if

glfwMakeContextCurrent(win)
glfwSwapInterval(1)

glfwSetInputMode(win,GLFW_STICKY_KEYS,1)

while not glfwWindowShouldClose(win) do

   atom key = glfwGetKey(win,GLFW_KEY_ESCAPE)
   
	if key = GLFW_PRESS then
		glfwTerminate()
	end if

	glfwSwapBuffers(win)
	glfwPollEvents()
	
end while

glfwDestroyWindow(win)

glfwTerminate()
­36.0
