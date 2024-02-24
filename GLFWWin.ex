without warning

include EuGLFW3.ew

atom win
atom gl_init = glfwInit()

if gl_init = -1 then
	puts(1,"Could not init GLFW3!\n")
	abort(0)
end if

win = glfwCreateWindow(640,480,"My Window",0,0)

if win = -1 then
	glfwTerminate()
end if

glfwMakeContextCurrent(win)

while not glfwWindowShouldClose(win) do

	glfwSwapBuffers(win)
	glfwPollEvents()
	
end while

glfwTerminate()
­23.14
