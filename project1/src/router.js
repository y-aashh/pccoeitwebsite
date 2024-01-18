import Vue from "vue";
import Router from "vue-router";
import Edit from "./views/Edit";
import Find from "./views/Find";
import Login from "./views/Login";
import Advanced from "./views/Advanced";
import Report from "./views/Report";
import Add from "./views/Add";
import Admin from "./views/Admin";
Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "login",
      component: Login
    },
    {
      path: "/login",
      name: "login",
      component: Login
    },
    {
      path: "/find",
      name: "find",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: Find
    },
    {
      path: "/edit",
      name: "edit",
      component: Edit
    },
    {
      path: "/advanced",
      name: "advanced",
      component: Advanced
    },
    {
      path: "/report",
      name: "report",
      component: Report
    },
    {
      path: "/add",
      name: "add",
      component: Add
    },
    {
      path: "/admin",
      name: "admin",
      component: Admin
    }
  ]
});
