// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
import ItemsController from "./items_controller"
import TodoController from "./todo_controller"

application.register("hello", HelloController)
application.register("items", ItemsController)
application.register("todo", TodoController)
