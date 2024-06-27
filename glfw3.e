--EuGLFW3
--Written by Andy P.
--Icy Viking Games
--GLFW 3.4.0
--Euphoria 4.1.0 Beta 2
--Copyright (c) 2024

include std/ffi.e
include std/os.e
include std/math.e

public atom gl

ifdef WINDOWS then
	gl = open_dll("glfw3.dll")
	elsifdef LINUX or FREEBSD then
	gl = open_dll("libglfw3.so")
	elsifdef OSX then
	gl = open_dll("libglfw3.dylib")
end ifdef

if gl = 0 then
 puts(1,"Failed to open GLFW3!\n")
 abort(0)
end if

--Flags
public constant GLFW_VERSION_MAJOR = 3,
				GLFW_VERSION_MINOR = 4,
				GLFW_VERSION_REVISION = 0
				
public constant GLFW_TRUE = 1,
				GLFW_FALSE = 0
				
public constant GLFW_RELEASE = 0,
				GLFW_PRESS = 1,
				GLFW_REPEAT = 2
				
public constant GLFW_HAT_CENTERED = 0,
				GLFW_HAT_UP = 1,
				GLFW_HAT_RIGHT = 2,
				GLFW_HAT_DOWN = 4,
				GLFW_HAT_LEFT = 8,
				GLFW_HAT_RIGHT_UP = or_all({GLFW_HAT_RIGHT,GLFW_HAT_UP}),
				GLFW_HAT_RIGHT_DOWN = or_all({GLFW_HAT_RIGHT,GLFW_HAT_DOWN}),
				GLFW_HAT_LEFT_UP = or_all({GLFW_HAT_LEFT,GLFW_HAT_UP}),
				GLFW_HAT_LEFT_DOWN = or_all({GLFW_HAT_LEFT,GLFW_HAT_DOWN})
				
public constant GLFW_KEY_UNKNOWN = -1

public constant GLFW_KEY_SPACE = 32,
				GLFW_KEY_APOSTROPHE = 39,
				GLFW_KEY_COMMA = 44,
				GLFW_KEY_MINUS = 45,
				GLFW_KEY_PERIOD = 46,
				GLFW_KEY_SLASH = 47,
				GLFW_KEY_0 = 48,
				GLFW_KEY_1 = 49,
				GLFW_KEY_2 = 50,
				GLFW_KEY_3 = 51,
				GLFW_KEY_4 = 52,
				GLFW_KEY_5 = 53,
				GLFW_KEY_6 = 54,
				GLFW_KEY_7 = 55,
				GLFW_KEY_8 = 56,
				GLFW_KEY_9 = 57,
				GLFW_KEY_SEMICOLON = 59,
				GLFW_KEY_EQUAL = 61,
				GLFW_KEY_A = 65,
				GLFW_KEY_B = 66,
				GLFW_KEY_C = 67,
				GLFW_KEY_D = 68,
				GLFW_KEY_E = 69,
				GLFW_KEY_F = 70,
				GLFW_KEY_G = 71,
				GLFW_KEY_H = 72,
				GLFW_KEY_I = 73,
				GLFW_KEY_J = 74,
				GLFW_KEY_K = 75,
				GLFW_KEY_L = 76,
				GLFW_KEY_M = 77,
				GLFW_KEY_N = 78,
				GLFW_KEY_O = 79,
				GLFW_KEY_P = 80,
				GLFW_KEY_Q = 81,
				GLFW_KEY_R = 82,
				GLFW_KEY_S = 83,
				GLFW_KEY_T = 84,
				GLFW_KEY_U = 85,
				GLFW_KEY_V = 86,
				GLFW_KEY_W = 87,
				GLFW_KEY_X = 88,
				GLFW_KEY_Y = 89,
				GLFW_KEY_Z = 90,
				GLFW_KEY_LEFT_BRACKET = 91,
				GLFW_KEY_BACKSLASH = 92,
				GLFW_KEY_RIGHT_BRACKET = 93,
				GLFW_KEY_GRAVE_ACCENT = 96,
				GLFW_KEY_WORLD_1 = 161,
				GLFW_KEY_WORLD_2 = 162
				
public constant GLFW_KEY_ESCAPE = 256,
				GLFW_KEY_ENTER = 257,
				GLFW_KEY_TAB = 268,
				GLFW_KEY_BACKSPACE = 259,
				GLFW_KEY_INSERT = 260,
				GLFW_KEY_DELETE = 261,
				GLFW_KEY_RIGHT = 262,
				GLFW_KEY_LEFT = 263,
				GLFW_KEY_DOWN = 264,
				GLFW_KEY_UP = 265,
				GLFW_KEY_PAGE_UP = 266,
				GLFW_KEY_PAGE_DOWN = 267,
				GLFW_KEY_HOME = 268,
				GLFW_KEY_END = 269,
				GLFW_KEY_CAPS_LOCK = 280,
				GLFW_KEY_SCROLL_LOCK = 281,
				GLFW_KEY_NUM_LOCK = 282,
				GLFW_KEY_PRINT_SCREEN = 283,
				GLFW_KEY_PAUSE = 284,
				GLFW_KEY_F1 = 290,
				GLFW_KEY_F2 = 291,
				GLFW_KEY_F3 = 292,
				GLFW_KEY_F4 = 293,
				GLFW_KEY_F5 = 294,
				GLFW_KEY_F6 = 295,
				GLFW_KEY_F7 = 296,
				GLFW_KEY_F8 = 297,
				GLFW_KEY_F9 = 298,
				GLFW_KEY_F10 = 299,
				GLFW_KEY_F11 = 300,
				GLFW_KEY_F12 = 301,
				GLFW_KEY_F13 = 302,
				GLFW_KEY_F14 = 303,
				GLFW_KEY_F15 = 304,
				GLFW_KEY_F16 = 305,
				GLFW_KEY_F17 = 306,
				GLFW_KEY_F18 = 307,
				GLFW_KEY_F19 = 308,
				GLFW_KEY_F20 = 309,
				GLFW_KEY_F21 = 310,
				GLFW_KEY_F22 = 311,
				GLFW_KEY_F23 = 312,
				GLFW_KEY_F24 = 313,
				GLFW_KEY_F25 = 314,
				GLFW_KEY_KP_0 = 320,
				GLFW_KEY_KP_1 = 321,
				GLFW_KEY_KP_2 = 322,
				GLFW_KEY_KP_3 = 323,
				GLFW_KEY_KP_4 = 324,
				GLFW_KEY_KP_5 = 325,
				GLFW_KEY_KP_6 = 326,
				GLFW_KEY_KP_7 = 327,
				GLFW_KEY_KP_8 = 328,
				GLFW_KEY_KP_9 = 329,
				GLFW_KEY_KP_DECIMAL = 330,
				GLFW_KEY_KP_DIVIDE = 331,
				GLFW_KEY_KP_MULTIPLY = 332,
				GLFW_KEY_KP_SUBTRACT = 333,
				GLFW_KEY_KP_ADD = 334,
				GLFW_KEY_KP_ENTER = 335,
				GLFW_KEY_KP_EQUAL = 336,
				GLFW_KEY_LEFT_SHIFT = 340,
				GLFW_KEY_LEFT_CONTROL = 341,
				GLFW_KEY_LEFT_ALT = 342,
				GLFW_KEY_LEFT_SUPER = 343,
				GLFW_KEY_RIGHT_SHIFT = 344,
				GLFW_KEY_RIGHT_CONTROL = 345,
				GLFW_KEY_RIGHT_ALT = 346,
				GLFW_KEY_RIGHT_SUPER = 347,
				GLFW_KEY_MENU = 348
				
public constant GLFW_KEY_LAST = GLFW_KEY_MENU

public constant GLFW_MOD_SHIFT = 0x0001,
				GLFW_MOD_CONTROL = 0x0002,
				GLFW_MOD_ALT = 0x0004,
				GLFW_MOD_SUPER = 0x0008,
				GLFW_MOD_CAPS_LOCK = 0x0010,
				GLFW_MOD_NUM_LOCK = 0x0020
				
public constant GLFW_MOUSE_BUTTON_1 = 0,
				GLFW_MOUSE_BUTTON_2 = 1,
				GLFW_MOUSE_BUTTON_3 = 2,
				GLFW_MOUSE_BUTTON_4 = 3,
				GLFW_MOUSE_BUTTON_5 = 4,
				GLFW_MOUSE_BUTTON_6 = 5,
				GLFW_MOUSE_BUTTON_7 = 6,
				GLFW_MOUSE_BUTTON_8 = 7,
				GLFW_MOUSE_BUTTON_LAST = GLFW_MOUSE_BUTTON_8,
				GLFW_MOUSE_BUTTON_LEFT = GLFW_MOUSE_BUTTON_1,
				GLFW_MOUSE_BUTTON_RIGHT = GLFW_MOUSE_BUTTON_2,
				GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3
				
public constant GLFW_JOYSTICK_1 = 0,
				GLFW_JOYSTICK_2 = 1,
				GLFW_JOYSTICK_3 = 2,
				GLFW_JOYSTICK_4 = 3,
				GLFW_JOYSTICK_5 = 4,
				GLFW_JOYSTICK_6 = 5,
				GLFW_JOYSTICK_7 = 6,
				GLFW_JOYSTICK_8 = 7,
				GLFW_JOYSTICK_9 = 8,
				GLFW_JOYSTICK_10 = 9,
				GLFW_JOYSTICK_11 = 10,
				GLFW_JOYSTICK_12 = 11,
				GLFW_JOYSTICK_13 = 12,
				GLFW_JOYSTICK_14 = 13,
				GLFW_JOYSTICK_15 = 14,
				GLFW_JOYSTICK_16 = 15,
				GLFW_JOYSTICK_LAST = GLFW_JOYSTICK_16
				
public constant GLFW_GAMEPAD_BUTTON_A = 0,
				GLFW_GAMEPAD_BUTTON_B = 1,
				GLFW_GAMEPAD_BUTTON_X = 2,
				GLFW_GAMEPAD_BUTTON_Y = 3,
				GLFW_GAMEPAD_BUTTON_LEFT_BUMPER = 4,
				GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = 5,
				GLFW_GAMEPAD_BUTTON_BACK = 6,
				GLFW_GAMEPAD_BUTTON_START = 7,
				GLFW_GAMEPAD_BUTTON_GUIDE = 8,
				GLFW_GAMEPAD_BUTTON_LEFT_THUMB = 9,
				GLFW_GAMEPAD_BUTTON_RIGHT_THUMB = 10,
				GLFW_GAMEPAD_BUTTON_DPAD_UP = 11,
				GLFW_GAMEPAD_BUTTON_DPAD_RIGHT = 12,
				GLFW_GAMEPAD_BUTTON_DPAD_DOWN = 13,
				GLFW_GAMEPAD_BUTTON_DPAD_LEFT = 14,
				GLFW_GAMEPAD_BUTTON_LAST = GLFW_GAMEPAD_BUTTON_DPAD_LEFT
				
public constant GLFW_GAMEPAD_BUTTON_CROSS = GLFW_GAMEPAD_BUTTON_A,
				GLFW_GAMEPAD_BUTTON_CIRCLE = GLFW_GAMEPAD_BUTTON_B,
				GLFW_GAMEPAD_BUTTON_SQUARE = GLFW_GAMEPAD_BUTTON_X,
				GLFW_GAMEPAD_BUTTON_TRIANGLE = GLFW_GAMEPAD_BUTTON_Y
				
public constant GLFW_GAMEPAD_AXIS_LEFT_X = 0,
				GLFW_GAMEPAD_AXIS_LEFT_Y = 1,
				GLFW_GAMEPAD_AXIS_RIGHT_X = 2,
				GLFW_GAMEPAD_AXIS_RIGHT_Y = 3,
				GLFW_GAMEPAD_AXIS_LEFT_TRIGGER = 4,
				GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER = 5,
				GLFW_GAMEPAD_AXIS_LAST = GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
				
public constant GLFW_NO_ERROR = 0

public constant GLFW_NOT_INTIALIZED = 0x00010001
public constant GLFW_NO_CURRENT_CONTEXT = 0x00010002
public constant GLFW_INVALID_ENUM = 0x00010003
public constant GLFW_INVALID_VALUE = 0x00010004
public constant GLFW_OUT_OF_MEMORY = 0x00010005
public constant GLFW_API_UNAVAILABLE = 0x00010006
public constant GLFW_VERSION_UNAVAILABLE = 0x00010007
public constant GLFW_PLATFORM_ERROR = 0x00010008
public constant GLFW_FORMAT_UNAVAILABLE = 0x00010009
public constant GLFW_NO_WINDOW_CONTEXT = 0x0001000A
public constant GLFW_FOCUSED = 0x00020001
public constant GLFW_ICONIFIED = 0x00020002
public constant GLFW_RESIZABLE = 0x00020003
public constant GLFW_VISIBLE = 0x00020004
public constant GLFW_DECORATED = 0x00020005
public constant GLFW_AUTO_ICONIFY = 0x00020006
public constant GLFW_FLOATING = 0x00020007
public constant GLFW_MAXIMIZED = 0x00020008
public constant GLFW_CENTER_CURSOR = 0x00020009
public constant GLFW_TRANSPARENT_FRAMEBUFFER = 0x0002000A
public constant GLFW_HOVERED = 0x0002000B
public constant GLFW_FOCUS_ON_SHOW = 0x0002000C
public constant GLFW_RED_BITS = 0x00021001
public constant GLFW_GREEN_BITS = 0x00021002
public constant GLFW_BLUE_BITS = 0x00021003
public constant GLFW_ALPHA_BITS = 0x00021004
public constant GLFW_DEPTH_BITS = 0x00021005
public constant GLFW_STENCIL_BITS = 0x00021006
public constant GLFW_ACCUM_RED_BITS = 0x00021007
public constant GLFW_ACCUM_GREEN_BITS = 0x00021008
public constant GLFW_ACCUM_BLUE_BITS = 0x00021009
public constant GLFW_ACCUM_ALPHA_BITS = 0x0002100A
public constant GLFW_AUX_BUFFERS = 0x0002100B
public constant GLFW_STEREO = 0x0002100C
public constant GLFW_SAMPLES = 0x0002100D
public constant GLFW_SRGB_CAPABLE = 0x0002100E
public constant GLFW_REFRESH_RATE = 0x0002100F
public constant GLFW_DOUBLEBUFFER = 0x00021010
public constant GLFW_CLIENT_API = 0x00022001
public constant GLFW_CONTEXT_VERSION_MAJOR = 0x00022002
public constant GLFW_CONTEXT_VERSION_MINOR = 0x00022003
public constant GLFW_CONTEXT_REVISION = 0x00022004
public constant GLFW_CONTEXT_ROBUSTNESS = 0x00022005
public constant GLFW_OPENGL_FORWARD_COMPAT = 0x00022006
public constant GLFW_OPENGL_DEBUG_CONTEXT = 0x00022007
public constant GLFW_OPENGL_PROFILE = 0x00022008
public constant GLFW_CONTEXT_RELEASE_BEHAVIOR = 0x00022009
public constant GLFW_CONTEXT_NO_ERROR = 0x0002200A
public constant GLFW_CONTEXT_CREATION_API = 0x0002200B
public constant GLFW_SCALE_TO_MONITOR = 0x0002200C
public constant GLFW_COCOA_RETINA_FRAMEBUFFER = 0x00023001
public constant GLFW_COCOA_FRAME_NAME = 0x00023002
public constant GLFW_COCOA_GRAPHICS_SWITCHING = 0x00023003
public constant GLFW_X11_CLASS_NAME = 0x00024001
public constant GLFW_X11_INSTANCE_NAME = 0x00024002

public constant GLFW_NO_API = 0,
				GLFW_OPENGL_API = 0x00030001,
				GLFW_OPENGL_ES_API = 0x00030002
				
public constant GLFW_NO_ROBUSTNESS = 0,
				GLFW_NO_RESET_NOTIFICATION = 0x00031001,
				GLFW_LOSE_CONTEXT_ON_RESET = 0x00031002
				
public constant GLFW_OPENGL_ANY_PROFILE = 0,
				GLFW_OPENGL_CORE_PROFILE = 0x00032001,
				GLFW_OPENGL_COMPAT_PROFILE = 0x00032002
				
public constant GLFW_CURSOR = 0x00033001,
				GLFW_STICKY_KEYS = 0x00033002,
				GLFW_STICKY_MOUSE_BUTTONS = 0x00033003,
				GLFW_LOCK_KEY_MODS = 0x00033004,
				GLFW_RAW_MOUSE_MOTION = 0x00033005
				
public constant GLFW_CURSOR_NORMAL = 0x00034001,
				GLFW_CURSOR_HIDDEN = 0x00034002,
				GLFW_CURSOR_DISABLED = 0x00034003
				
public constant GLFW_ANY_RELEASE_BEHAVIOR = 0,
				GLFW_RELEASE_BEHAVIOR_FLUSH = 0x00035001,
				GLFW_RELEASE_BEHAVIOR_NONE = 0x00035002
				
public constant GLFW_NATIVE_CONTEXT_API = 0x00036001,
				GLFW_EGL_CONTEXT_API = 0x00036002,
				GLFW_OSMESA_CONTEXT_API = 0x00036003
				
public constant GLFW_ARROW_CURSOR = 0x00036001

public constant GLFW_IBEAM_CURSOR = 0x00036002

public constant GLFW_CROSSHAIR_CURSOR = 0x00036003

public constant GLFW_HAND_CURSOR = 0x00036004

public constant GLFW_HRESIZE_CURSOR = 0x00036005

public constant GLFW_VRESIZE_CURSOR = 0x00036006

public constant GLFW_CONNECTED = 0x00040001,
				GLFW_DISCONNECTED = 0x00040002
				
public constant GLFW_JOYSTICK_HAT_BUTTONS = 0x00050001

public constant GLFW_COCOA_CHDIR_RESOURCES = 0x00051001

public constant GLFW_COCOA_MENUBAR = 0x00051002

public constant GLFW_DONT_CARE = -1

--Structs
public constant GLFWvidmode = define_c_struct({
	C_INT, --width
	C_INT, --height
	C_INT, --redBits
	C_INT, --greenBits
	C_INT, --blueBits
	C_INT --refreshRate
})

public constant GLFWgammaramp = define_c_struct({
	C_POINTER, --red
	C_POINTER, --green
	C_POINTER, --blue
	C_UINT --size
})

public constant GLFWimage = define_c_struct({
	C_INT, --width
	C_INT, --height
	C_POINTER --pixels
})

public constant GLFWgamepadstate = define_c_struct({
	{C_UCHAR,15}, --buttons,
	{C_FLOAT,6} --axes
})

public constant GLFWallocator = define_c_struct({
	C_POINTER, --allocate
	C_POINTER, --reallocate
	C_POINTER, --deallocate
	C_POINTER  --user
})

export constant xglfwInit = define_c_func(gl,"+glfwInit",{},C_INT)

public function glfwInit()
	return c_func(xglfwInit,{})
end function

export constant xglfwTerminate = define_c_proc(gl,"+glfwTerminate",{})

public procedure glfwTerminate()
	c_proc(xglfwTerminate,{})
end procedure

export constant xglfwInitHint = define_c_proc(gl,"+glfwInitHint",{C_INT,C_INT})

public procedure glfwInitHint(atom hint,atom val)
	c_proc(xglfwInitHint,{hint,val})
end procedure

export constant xglfwGetVersion = define_c_proc(gl,"+glfwGetVersion",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetVersion(atom major,atom minor,atom rev)
	c_proc(xglfwGetVersion,{major,minor,rev})
end procedure

export constant xglfwGetVersionString = define_c_func(gl,"+glfwGetVersionString",{},C_STRING)

public function glfwGetVersionString()
	return c_func(xglfwGetVersionString,{})
end function

export constant xglfwGetError = define_c_func(gl,"+glfwGetError",{C_STRING},C_INT)

public function glfwGetError(sequence desc)
	return c_func(xglfwGetError,{desc})
end function

export constant xglfwSetErrorCallback = define_c_func(gl,"+glfwSetErrorCallback",{C_POINTER},C_POINTER)

public function glfwSetErrorCallback(atom cb)
	return c_func(xglfwSetErrorCallback,{cb})
end function

export constant xglfwGetMonitors = define_c_func(gl,"+glfwGetMonitors",{C_POINTER},C_POINTER)

public function glfwGetMonitors(atom cnt)
	return c_func(xglfwGetMonitors,{cnt})
end function

export constant xglfwGetPrimaryMonitor = define_c_func(gl,"+glfwGetPrimaryMonitor",{},C_POINTER)

public function glfwGetPrimaryMonitor()
	return c_func(xglfwGetPrimaryMonitor,{})
end function

export constant xglfwGetMonitorPos = define_c_proc(gl,"+glfwGetMonitorPos",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetMonitorPos(atom mon,atom x,atom y)
	c_proc(xglfwGetMonitorPos,{mon,x,y})
end procedure

export constant xglfwGetMonitorWorkarea = define_c_proc(gl,"+glfwGetMonitorWorkarea",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetMonitorWorkarea(atom mon,atom x,atom y,atom w,atom h)
	c_proc(xglfwGetMonitorWorkarea,{mon,x,y,w,h})
end procedure

export constant xglfwGetMonitorPhysicalSize = define_c_proc(gl,"+glfwGetMonitorPhysicalSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetMonitorPhysicalSize(atom mon,atom w,atom h)
	c_proc(xglfwGetMonitorPhysicalSize,{mon,w,h})
end procedure

export constant xglfwGetMonitorContentScale = define_c_proc(gl,"+glfwGetMonitorContentScale",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetMonitorContentScale(atom mon,atom x,atom y)
	c_proc(xglfwGetMonitorContentScale,{mon,x,y})
end procedure

export constant xglfwGetMonitorName = define_c_func(gl,"+glfwGetMonitorName",{C_POINTER},C_STRING)

public function glfwGetMonitorName(atom mon)
	return c_func(xglfwGetMonitorName,{mon})
end function

export constant xglfwSetMonitorUserPointer = define_c_proc(gl,"+glfwSetMonitorUserPointer",{C_POINTER,C_POINTER})

public procedure glfwSetMonitorUserPointer(atom mon,object ptr)
	c_proc(xglfwSetMonitorUserPointer,{mon,ptr})
end procedure

export constant xglfwGetMonitorUserPointer = define_c_func(gl,"+glfwGetMonitorUserPointer",{C_POINTER},C_POINTER)

public function glfwGetMonitorUserPointer(atom mon)
	return c_func(xglfwGetMonitorUserPointer,{mon})
end function

export constant xglfwSetMonitorCallback = define_c_func(gl,"+glfwSetMonitorCallback",{C_POINTER},C_POINTER)

public function glfwSetMonitorCallback(atom cb)
	return c_func(xglfwSetMonitorCallback,{cb})
end function

export constant xglfwGetVideoModes = define_c_func(gl,"+glfwGetVideoModes",{C_POINTER,C_POINTER},C_POINTER)

public function glfwGetVideoModes(atom mon,atom cnt)
	return c_func(xglfwGetVideoModes,{mon,cnt})
end function

export constant xglfwGetVideoMode = define_c_func(gl,"+glfwGetVideoMode",{C_POINTER},C_POINTER)

public function glfwGetVideoMode(atom mon)
	return c_func(xglfwGetVideoMode,{mon})
end function

export constant xglfwSetGamma = define_c_proc(gl,"+glfwSetGamma",{C_POINTER,C_FLOAT})

public procedure glfwSetGamma(atom mon,atom gamma)
	c_proc(xglfwSetGamma,{mon,gamma})
end procedure

export constant xglfwGetGammaRamp = define_c_func(gl,"+glfwGetGammaRamp",{C_POINTER},C_POINTER)

public function glfwGetGammaRamp(atom mon)
	return c_func(xglfwGetGammaRamp,{mon})
end function

export constant xglfwSetGammaRamp = define_c_proc(gl,"+glfwSetGammaRamp",{C_POINTER,C_POINTER})

public procedure glfwSetGammaRamp(atom mon,atom ramp)
	c_proc(xglfwSetGammaRamp,{mon,ramp})
end procedure

export constant xglfwDefaultWindowHints = define_c_proc(gl,"+glfwDefaultWindowHints",{})

public procedure glfwDefaultWindowHints()
	c_proc(xglfwDefaultWindowHints,{})
end procedure

export constant xglfwWindowHint = define_c_proc(gl,"+glfwWindowHint",{C_INT,C_INT})

public procedure glfwWindowHint(atom h,atom v)
	c_proc(xglfwWindowHint,{h,v})
end procedure

export constant xglfwWindowHintString = define_c_proc(gl,"+glfwWindowHintString",{C_INT,C_STRING})

public procedure glfwWindowHintString(atom h,sequence v)
	c_proc(xglfwWindowHintString,{h,v})
end procedure

export constant xglfwCreateWindow = define_c_func(gl,"+glfwCreateWindow",{C_INT,C_INT,C_STRING,C_POINTER,C_POINTER},C_POINTER)

public function glfwCreateWindow(atom w,atom h,sequence title,atom mon,atom shr)
	return c_func(xglfwCreateWindow,{w,h,title,mon,shr})
end function

export constant xglfwDestroyWindow = define_c_proc(gl,"+glfwDestroyWindow",{C_POINTER})

public procedure glfwDestroyWindow(atom win)
	c_proc(xglfwDestroyWindow,{win})
end procedure

export constant xglfwWindowShouldClose = define_c_func(gl,"+glfwWindowShouldClose",{C_POINTER},C_INT)

public function glfwWindowShouldClose(atom win)
	return c_func(xglfwWindowShouldClose,{win})
end function

export constant xglfwSetWindowShouldClose = define_c_proc(gl,"+glfwSetWindowShouldClose",{C_POINTER,C_INT})

public procedure glfwSetWindowShouldClose(atom win,atom v)
	c_proc(xglfwSetWindowShouldClose,{win,v})
end procedure

export constant xglfwSetWindowTitle = define_c_proc(gl,"+glfwSetWindowTitle",{C_POINTER,C_STRING})

public procedure glfwSetWindowTitle(atom win,sequence title)
	c_proc(xglfwSetWindowTitle,{win,title})
end procedure

export constant xglfwSetWindowIcon = define_c_proc(gl,"+glfwSetWindowIcon",{C_POINTER,C_INT,C_POINTER})

public procedure glfwSetWindowIcon(atom win,atom cnt,atom img)
	c_proc(xglfwSetWindowIcon,{win,cnt,img})
end procedure

export constant xglfwGetWindowPos = define_c_proc(gl,"+glfwGetWindowPos",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetWindowPos(atom win,atom x,atom y)
	c_proc(xglfwGetWindowPos,{win,x,y})
end procedure

export constant xglfwSetWindowPos = define_c_proc(gl,"+glfwSetWindowPos",{C_POINTER,C_INT,C_INT})

public procedure glfwSetWindowPos(atom win,atom x,atom y)
	c_proc(xglfwSetWindowPos,{win,x,y})
end procedure

export constant xglfwGetWindowSize = define_c_proc(gl,"+glfwGetWindowSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetWindowSize(atom win,atom w,atom h)
	c_proc(xglfwGetWindowSize,{win,w,h})
end procedure

export constant xglfwSetWindowSizeLimits = define_c_proc(gl,"+glfwSetWindowSizeLimits",{C_POINTER,C_INT,C_INT,C_INT,C_INT})

public procedure glfwSetWindowSizeLimits(atom win,atom minw,atom minh,atom maxw,atom maxh)
	c_proc(xglfwSetWindowSizeLimits,{win,minw,minh,maxw,maxh})
end procedure

export constant xglfwSetWindowAspectRatio = define_c_proc(gl,"+glfwSetWindowAspectRatio",{C_POINTER,C_INT,C_INT})

public procedure glfwSetWindowAspectRatio(atom win,atom num,atom den)
	c_proc(xglfwSetWindowAspectRatio,{win,num,den})
end procedure

export constant xglfwSetWindowSize = define_c_proc(gl,"+glfwSetWindowSize",{C_POINTER,C_INT,C_INT})

public procedure glfwSetWindowSize(atom win,atom w,atom h)
	c_proc(xglfwSetWindowSize,{win,w,h})
end procedure

export constant xglfwGetFramebufferSize = define_c_proc(gl,"+glfwGetFramebufferSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetFramebufferSize(atom win,atom w,atom h)
	c_proc(xglfwGetFramebufferSize,{win,w,h})
end procedure

export constant xglfwGetWindowFrameSize = define_c_proc(gl,"+glfwGetWindowFrameSize",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetWindowFrameSize(atom win,atom left,atom top,atom right,atom bottom)
	c_proc(xglfwGetWindowFrameSize,{win,left,top,right,bottom})
end procedure

export constant xglfwGetWindowContentScale = define_c_proc(gl,"+glfwGetWindowContentScale",{C_POINTER,C_POINTER,C_POINTER})

public procedure glfwGetWindowContentScale(atom win,atom x,atom y)
	c_proc(xglfwGetWindowContentScale,{win,x,y})
end procedure

export constant xglfwGetWindowOpacity = define_c_func(gl,"+glfwGetWindowOpacity",{C_POINTER},C_FLOAT)

public function glfwGetWindowOpacity(atom win)
	return c_func(xglfwGetWindowOpacity,{win})
end function

export constant xglfwSetWindowOpacity = define_c_proc(gl,"+glfwSetWindowOpacity",{C_POINTER,C_FLOAT})

public procedure glfwSetWindowOpacity(atom win,atom op)
	c_proc(xglfwSetWindowOpacity,{win,op})
end procedure

export constant xglfwIconifyWindow = define_c_proc(gl,"+glfwIconifyWindow",{C_POINTER})

public procedure glfwIconifyWindow(atom win)
	c_proc(xglfwIconifyWindow,{win})
end procedure

export constant xglfwRestoreWindow = define_c_proc(gl,"+glfwRestoreWindow",{C_POINTER})

public procedure glfwRestoreWindow(atom win)
	c_proc(xglfwRestoreWindow,{win})
end procedure

export constant xglfwMaximizeWindow = define_c_proc(gl,"+glfwMaximizeWindow",{C_POINTER})

public procedure glfwMaximizeWindow(atom win)
	c_proc(xglfwMaximizeWindow,{win})
end procedure

export constant xglfwShowWindow = define_c_proc(gl,"+glfwShowWindow",{C_POINTER})

public procedure glfwShowWindow(atom win)
	c_proc(xglfwShowWindow,{win})
end procedure

export constant xglfwHideWindow = define_c_proc(gl,"+glfwHideWindow",{C_POINTER})

public procedure glfwHideWindow(atom win)
	c_proc(xglfwHideWindow,{win})
end procedure

export constant xglfwFocusWindow = define_c_proc(gl,"+glfwFocusWindow",{C_POINTER})

public procedure glfwFocusWindow(atom win)
	c_proc(xglfwFocusWindow,{win})
end procedure

export constant xglfwRequestWindowAttention = define_c_proc(gl,"+glfwRequestWindowAttention",{C_POINTER})

public procedure glfwRequestWindowAttention(atom win)
	c_proc(xglfwRequestWindowAttention,{win})
end procedure

export constant xglfwGetWindowMonitor = define_c_func(gl,"+glfwGetWindowMonitor",{C_POINTER},C_POINTER)

public function glfwGetWindowMonitor(atom win)
	return c_func(xglfwGetWindowMonitor,{win})
end function

export constant xglfwSetWindowMonitor = define_c_proc(gl,"+glfwSetWindowMonitor",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT})

public procedure glfwSetWindowMonitor(atom win,atom mon,atom x,atom y,atom w,atom h,atom rr)
	c_proc(xglfwSetWindowMonitor,{win,mon,x,y,w,h,rr})
end procedure

export constant xglfwGetWindowAttrib = define_c_func(gl,"+glfwGetWindowAttrib",{C_POINTER,C_INT},C_INT)

public function glfwGetWindowAttrib(atom win,atom att)
	return c_func(xglfwGetWindowAttrib,{win,att})
end function

export constant xglfwSetWindowAttrib = define_c_proc(gl,"+glfwSetWindowAttrib",{C_POINTER,C_INT,C_INT})

public procedure glfwSetWindowAttrib(atom win,atom att,atom val)
	c_proc(xglfwSetWindowAttrib,{win,att,val})
end procedure

export constant xglfwSetWindowUserPointer = define_c_proc(gl,"+glfwSetWindowUserPointer",{C_POINTER,C_POINTER})

public procedure glfwSetWindowUserPointer(atom win,object ptr)
	c_proc(xglfwSetWindowUserPointer,{win,ptr})
end procedure

export constant xglfwGetWindowUserPointer = define_c_func(gl,"+glfwGetWindowUserPointer",{C_POINTER},C_POINTER)

public function glfwGetWindowUserPointer(atom win)
	return c_func(xglfwGetWindowUserPointer,{win})
end function

export constant xglfwSetWindowPosCallback = define_c_func(gl,"+glfwSetWindowPosCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowPosCallback(atom win,atom cb)
	return c_func(xglfwSetWindowPosCallback,{win,cb})
end function

export constant xglfwSetWindowSizeCallback = define_c_func(gl,"+glfwSetWindowSizeCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowSizeCallback(atom win,atom cb)
	return c_func(xglfwSetWindowSizeCallback,{win,cb})
end function

export constant xglfwSetWindowCloseCallback = define_c_func(gl,"+glfwSetWindowCloseCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowCloseCallback(atom win,atom cb)
	return c_func(xglfwSetWindowCloseCallback,{win,cb})
end function

export constant xglfwSetWindowRefreshCallback = define_c_func(gl,"+glfwSetWindowRefreshCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowRefreshCallback(atom win,atom cb)
	return c_func(xglfwSetWindowRefreshCallback,{win,cb})
end function

export constant xglfwSetWindowFocusCallback = define_c_func(gl,"+glfwSetWindowFocusCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowFocusCallback(atom win,atom cb)
	return c_func(xglfwSetWindowFocusCallback,{win,cb})
end function

export constant xglfwSetWindowIconifyCallback = define_c_func(gl,"+glfwSetWindowIconifyCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowIconifyCallback(atom win,atom cb)
	return c_func(xglfwSetWindowIconifyCallback,{win,cb})
end function

export constant xglfwSetWindowMaximizeCallback = define_c_func(gl,"+glfwSetWindowMaximizeCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowMaximizeCallback(atom win,atom cb)
	return c_func(xglfwSetWindowMaximizeCallback,{win,cb})
end function

export constant xglfwSetFramebufferSizeCallback = define_c_func(gl,"+glfwSetFramebufferSizeCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetFramebufferSizeCallback(atom win,atom cb)
	return c_func(xglfwSetFramebufferSizeCallback,{win,cb})
end function

export constant xglfwSetWindowContentScaleCallback = define_c_func(gl,"+glfwSetWindowContentScaleCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetWindowContentScaleCallback(atom win,atom cb)
	return c_func(xglfwSetWindowContentScaleCallback,{win,cb})
end function

export constant xglfwPollEvents = define_c_proc(gl,"+glfwPollEvents",{})

public procedure glfwPollEvents()
	c_proc(xglfwPollEvents,{})
end procedure

export constant xglfwWaitEvents = define_c_proc(gl,"+glfwWaitEvents",{})

public procedure glfwWaitEvents()
	c_proc(xglfwWaitEvents,{})
end procedure

export constant xglfwWaitEventsTimeout = define_c_proc(gl,"+glfwWaitEventsTimeout",{C_DOUBLE})

public procedure glfwWaitEventsTimeout(atom tot)
	c_proc(xglfwWaitEventsTimeout,{tot})
end procedure

export constant xglfwPostEmptyEvent = define_c_proc(gl,"+glfwPostEmptyEvent",{})

public procedure glfwPostEmptyEvent()
	c_proc(xglfwPostEmptyEvent,{})
end procedure

export constant xglfwGetInputMode = define_c_func(gl,"+glfwGetInputMode",{C_POINTER,C_INT},C_INT)

public function glfwGetInputMode(atom win,atom m)
	return c_func(xglfwGetInputMode,{win,m})
end function

export constant xglfwSetInputMode = define_c_proc(gl,"+glfwSetInputMode",{C_POINTER,C_INT,C_INT})

public procedure glfwSetInputMode(atom win,atom mode,atom val)
	c_proc(xglfwSetInputMode,{win,mode,val})
end procedure

export constant xglfwRawMouseMotionSupported = define_c_func(gl,"+glfwRawMouseMotionSupported",{},C_INT)

public function glfwRawMouseMotionSupported()
	return c_func(xglfwRawMouseMotionSupported,{})
end function

export constant xglfwGetKeyName = define_c_func(gl,"+glfwGetKeyName",{C_INT,C_INT},C_STRING)

public function glfwGetKeyName(atom key,atom scan)
	return c_func(xglfwGetKeyName,{key,scan})
end function

export constant xglfwGetKeyScancode = define_c_func(gl,"+glfwGetKeyScancode",{C_INT},C_INT)

public function glfwGetKeyScancode(atom k)
	return c_func(xglfwGetKeyScancode,{k})
end function

export constant xglfwGetKey = define_c_func(gl,"+glfwGetKey",{C_POINTER,C_INT},C_INT)

public function glfwGetKey(atom win,atom k)
	return c_func(xglfwGetKey,{win,k})
end function

export constant xglfwGetMouseButton = define_c_func(gl,"+glfwGetMouseButton",{C_POINTER,C_INT},C_INT)

public function glfwGetMouseButton(atom win,atom btn)
	return c_func(xglfwGetMouseButton,{win,btn})
end function

export constant xglfwGetCursorPos = define_c_func(gl,"+glfwGetCursorPos",{C_POINTER,C_POINTER},C_POINTER)

public procedure glfwGetCursorPos(atom win,atom x,atom y)
	c_proc(xglfwGetCursorPos,{win,x,y})
end procedure

export constant xglfwSetCursorPos = define_c_proc(gl,"+glfwSetCursorPos",{C_POINTER,C_DOUBLE,C_DOUBLE})

public procedure glfwSetCursorPos(atom win,atom x,atom y)
	c_proc(xglfwSetCursorPos,{win,x,y})
end procedure

export constant xglfwCreateCursor = define_c_func(gl,"+glfwCreateCursor",{C_POINTER,C_INT,C_INT},C_POINTER)

public function glfwCreateCursor(atom img,atom x,atom y)
	return c_func(xglfwCreateCursor,{img,x,y})
end function

export constant xglfwCreateStandardCursor = define_c_func(gl,"+glfwCreateStandardCursor",{C_INT},C_POINTER)

public function glfwCreateStandardCursor(atom sh)
	return c_func(xglfwCreateStandardCursor,{sh})
end function

export constant xglfwDestroyCursor = define_c_proc(gl,"+glfwDestroyCursor",{C_POINTER})

public procedure glfwDestroyCursor(atom cur)
	c_proc(xglfwDestroyCursor,{cur})
end procedure

export constant xglfwSetCursor = define_c_proc(gl,"+glfwSetCursor",{C_POINTER,C_POINTER})

public procedure glfwSetCursor(atom win,atom cur)
	c_proc(xglfwSetCursor,{win,cur})
end procedure

export constant xglfwSetKeyCallback = define_c_func(gl,"+glfwSetKeyCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetKeyCallback(atom win,atom cb)
	return c_func(xglfwSetKeyCallback,{win,cb})
end function

export constant xglfwSetCharCallback = define_c_func(gl,"+glfwSetCharCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetCharCallback(atom win,atom cb)
	return c_func(xglfwSetCharCallback,{win,cb})
end function

export constant xglfwSetCharModsCallback = define_c_func(gl,"+glfwSetCharModsCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetCharModsCallback(atom win,atom cb)
	return c_func(xglfwSetCharModsCallback,{win,cb})
end function

export constant xglfwSetMouseButtonCallback = define_c_func(gl,"+glfwSetMouseButtonCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetMouseButtonCallback(atom win,atom cb)
	return c_func(xglfwSetMouseButtonCallback,{win,cb})
end function

export constant xglfwSetCursorPosCallback = define_c_func(gl,"+glfwSetCursorPosCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetCursorPosCallback(atom win,atom cb)
	return c_func(xglfwSetCursorPosCallback,{win,cb})
end function

export constant xglfwSetCursorEnterCallback = define_c_func(gl,"+glfwSetCursorEnterCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetCursorEnterCallback(atom win,atom cb)
	return c_func(xglfwSetCursorEnterCallback,{win,cb})
end function

export constant xglfwSetScrollCallback = define_c_func(gl,"+glfwSetScrollCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetScrollCallback(atom win,atom cb)
	return c_func(xglfwSetScrollCallback,{win,cb})
end function

export constant xglfwSetDropCallback = define_c_func(gl,"+glfwSetDropCallback",{C_POINTER,C_POINTER},C_POINTER)

public function glfwSetDropCallback(atom win,atom cb)
	return c_func(xglfwSetDropCallback,{win,cb})
end function

export constant xglfwJoystickPresent = define_c_func(gl,"+glfwJoystickPresent",{C_INT},C_INT)

public function glfwJoystickPresent(atom id)
	return c_func(xglfwJoystickPresent,{id})
end function

export constant xglfwGetJoystickAxes = define_c_func(gl,"+glfwGetJoystickAxes",{C_INT,C_POINTER},C_POINTER)

public function glfwGetJoystickAxes(atom id,atom cnt)
	return c_func(xglfwGetJoystickAxes,{id,cnt})
end function

export constant xglfwGetJoystickButtons = define_c_func(gl,"+glfwGetJoystickButtons",{C_INT,C_POINTER},C_POINTER)

public function glfwGetJoystickButtons(atom id,atom cnt)
	return c_func(xglfwGetJoystickButtons,{id,cnt})
end function

export constant xglfwGetJoystickHats = define_c_func(gl,"+glfwGetJoystickHats",{C_INT,C_POINTER},C_POINTER)

public function glfwGetJoystickHats(atom id,atom cnt)
	return c_func(xglfwGetJoystickHats,{id,cnt})
end function

export constant xglfwGetJoystickName = define_c_func(gl,"+glfwGetJoystickName",{C_INT},C_STRING)

public function glfwGetJoystickName(atom id)
	return c_func(xglfwGetJoystickName,{id})
end function

export constant xglfwGetJoystickGUID = define_c_func(gl,"+glfwGetJoystickGUID",{C_INT},C_STRING)

public function glfwGetJoystickGUID(atom id)
	return c_func(xglfwGetJoystickGUID,{id})
end function

export constant xglfwSetJoystickUserPointer = define_c_proc(gl,"+glfwSetJoystickUserPointer",{C_INT,C_POINTER})

public procedure glfwSetJoystickUserPointer(atom id,object ptr)
	c_proc(xglfwSetJoystickUserPointer,{id,ptr})
end procedure

export constant xglfwGetJoystickUserPointer = define_c_func(gl,"+glfwGetJoystickUserPointer",{C_INT},C_POINTER)

public function glfwGetJoystickUserPointer(atom id)
	return c_func(xglfwGetJoystickUserPointer,{id})
end function

export constant xglfwJoystickIsGamepad = define_c_func(gl,"+glfwJoystickIsGamepad",{C_INT},C_INT)

public function glfwJoystickIsGamepad(atom id)
	return c_func(xglfwJoystickIsGamepad,{id})
end function

export constant xglfwSetJoystickCallback = define_c_func(gl,"+glfwSetJoystickCallback",{C_POINTER},C_POINTER)

public function glfwSetJoystickCallback(atom cb)
	return c_func(xglfwSetJoystickCallback,{cb})
end function

export constant xglfwUpdateGamepadMappings = define_c_func(gl,"+glfwUpdateGamepadMappings",{C_STRING},C_INT)

public function glfwUpdateGamepadMappings(sequence str)
	return c_func(xglfwUpdateGamepadMappings,{str})
end function

export constant xglfwGetGamepadName = define_c_func(gl,"+glfwGetGamepadName",{C_INT},C_STRING)

public function glfwGetGamepadName(atom id)
	return c_func(xglfwGetGamepadName,{id})
end function

export constant xglfwGetGamepadState = define_c_func(gl,"+glfwGetGamepadState",{C_INT,C_POINTER},C_INT)

public function glfwGetGamepadState(atom id,atom st)
	return c_func(xglfwGetGamepadState,{id,st})
end function

export constant xglfwSetClipboardString = define_c_proc(gl,"+glfwSetClipboardString",{C_POINTER,C_STRING})

public procedure glfwSetClipboardString(atom win,sequence st)
	c_proc(xglfwSetClipboardString,{win,st})
end procedure

export constant xglfwGetClipboardString = define_c_func(gl,"+glfwGetClipboardString",{C_POINTER},C_STRING)

public function glfwGetClipboardString(atom win)
	return c_func(xglfwGetClipboardString,{win})
end function

export constant xglfwGetTime = define_c_func(gl,"+glfwGetTime",{},C_DOUBLE)

public function glfwGetTime()
	return c_func(xglfwGetTime,{})
end function

export constant xglfwSetTime = define_c_proc(gl,"+glfwSetTime",{C_DOUBLE})

public procedure glfwSetTime(atom t)
	c_proc(xglfwSetTime,{t})
end procedure

export constant xglfwGetTimerValue = define_c_func(gl,"+glfwGetTimerValue",{},C_UINT64)

public function glfwGetTimerValue()
	return c_func(xglfwGetTimerValue,{})
end function

export constant xglfwGetTimerFrequency = define_c_func(gl,"+glfwGetTimerFrequency",{},C_UINT64)

public function glfwGetTimerFrequency()
	return c_func(xglfwGetTimerFrequency,{})
end function

export constant xglfwMakeContextCurrent = define_c_proc(gl,"+glfwMakeContextCurrent",{C_POINTER})

public procedure glfwMakeContextCurrent(atom win)
	c_proc(xglfwMakeContextCurrent,{win})
end procedure

export constant xglfwGetCurrentContext = define_c_func(gl,"+glfwGetCurrentContext",{},C_POINTER)

public function glfwGetCurrentContext()
	return c_func(xglfwGetCurrentContext,{})
end function

export constant xglfwSwapBuffers = define_c_proc(gl,"+glfwSwapBuffers",{C_POINTER})

public procedure glfwSwapBuffers(atom win)
	c_proc(xglfwSwapBuffers,{win})
end procedure

export constant xglfwSwapInterval = define_c_proc(gl,"+glfwSwapInterval",{C_INT})

public procedure glfwSwapInterval(atom i)
	c_proc(xglfwSwapInterval,{i})
end procedure

export constant xglfwExtensionSupported = define_c_func(gl,"+glfwExtensionSupported",{C_STRING},C_INT)

public function glfwExtensionSupported(sequence ext)
	return c_func(xglfwExtensionSupported,{ext})
end function

export constant xglfwGetProcAddress = define_c_func(gl,"+glfwGetProcAddress",{C_STRING},C_POINTER)

public function glfwGetProcAddress(sequence name)
	return c_func(xglfwGetProcAddress,{name})
end function

export constant xglfwVulkanSupported = define_c_func(gl,"+glfwVulkanSupported",{},C_INT)

public function glfwVulkanSupported()
	return c_func(xglfwVulkanSupported,{})
end function

export constant xglfwGetRequiredInstanceExtensions = define_c_func(gl,"+glfwGetRequiredInstanceExtensions",{C_POINTER},C_STRING)

public function glfwGetRequiredInstanceExtensions(atom cnt)
	return c_func(xglfwGetRequiredInstanceExtensions,{cnt})
end function

export constant xglfwGetInstanceProcAddress = define_c_func(gl,"+glfwGetInstanceProcAddress",{C_POINTER,C_STRING},C_POINTER)

public function glfwGetInstanceProcAddress(atom inst,sequence name)
	return c_func(xglfwGetInstanceProcAddress,{inst,name})
end function

export constant xglfwGetPhysicalDevicePresentationSupport = define_c_func(gl,"+glfwGetPhysicalDevicePresentationSupport",{C_POINTER,C_POINTER,C_UINT32},C_INT)

public function glfwGetPhysicalDevicePresentationSupport(atom inst,atom dev,atom que)
	return c_func(xglfwGetPhysicalDevicePresentationSupport,{inst,dev,que})
end function

export constant xglfwCreateWindowSurface = define_c_func(gl,"+glfwCreateWindowSurface",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function glfwCreateWindowSurface(atom inst,atom win,atom alloc,atom surf)
	return c_func(xglfwCreateWindowSurface,{inst,win,alloc,surf})
end function
­381.18
