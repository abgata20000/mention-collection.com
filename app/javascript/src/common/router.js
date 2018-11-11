const Router = (controller, action, callback) => {
  document.addEventListener("DOMContentLoaded", () => {
    const body = document.body;
    const currentController = body.getAttribute("controller");
    const currentAction = body.getAttribute("action");
    if (currentController === controller && currentAction === action) {
      return callback();
    }
    if (currentController === controller && Array.isArray(action) && action.includes(currentAction)) {
      return callback();
    }
  });
};
export default Router;
