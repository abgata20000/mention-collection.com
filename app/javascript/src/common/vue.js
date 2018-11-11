import Vue from "vue/dist/vue.esm";
import Vuex from "vuex";
import SuiVue from "semantic-ui-vue";
import Axios from "axios";

Vue.prototype.$http = Axios;

Vue.use(Vuex);
Vue.use(SuiVue);
export { Vue, Vuex };
