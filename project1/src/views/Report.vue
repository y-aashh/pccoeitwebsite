<template>
<div>
  <Navbar/>
<div style="margin-top: 10px">
     <div v-if="this.show === true" class='wave -one'></div>
    <div v-if="this.show === true" class='wave -two'></div>
    <div v-if="this.show === true" class='wave -three'></div>

  <b-container>

  <b-col cols="12">
  <b-dropdown :text="`${selected}`" class="m-md-2" variant="outline-dark">
    <b-dropdown-item @click="yearWise">Year Wise</b-dropdown-item>
    <b-dropdown-item @click="numberDays">Number of days</b-dropdown-item>
  </b-dropdown>
  </b-col>
  <div v-if="this.show === true" class="wrapper fadeInDown" >
  <b-row>
  <b-col cols="10">
  <v-card
    class="pl-1 text-center"
    color="rgba(255,255,255, 0.9)"
    max-width="1100"
  >
    <v-card-text>
      <v-sheet color="rgba(255,255,255, .12)">
        <v-sparkline
          :value="value"
          :labels="value1"
          :label-size="5"
          type="bar"
          color="rgba(0, 170, 225, 1)"
          height="150"
          :line-width="width"
        >
        </v-sparkline>
      </v-sheet>
    </v-card-text>
    <v-card-text>
      <div class="h3 font-weight-thin">{{ selected }} Distribution</div>
    </v-card-text>

    
  </v-card>
  </b-col>
  <b-col cols=2>
  <b-table :items="items"
                    large
                    white
                    light          
                    borderless
                    style="background-color: white; padding: 5;"
                    >
  </b-table>

  </b-col>
  </b-row>
  </div>
  </b-container>

</div>
</div>
</template>



<style scoped>

.title {
  left: 0;
  top: 0;
  width: 50%;
  text-align: left;
  text-shadow: 0 1px 0 rgba(black, .1);
  text-indent: .3em;
}
.wrapper {
  padding-top: 10px;
  padding-left: 50px;
  padding-right: 50px;
}
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:0.5s;
  -moz-animation-duration:0.5s;
  animation-duration:0.5s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.1s;
  -moz-animation-delay: 0.1s;
  animation-delay: 0.1s;
}

/*CIRCLE*/


.wave {
  opacity: .6;
  position: absolute;
  top: 3%;
  left: 50%;
  background: #0af;
  width: 800px;
  height: 800px;
  margin-left: -400px;
  margin-top: 250px;
  transform-origin: 50% 48%;
  border-radius: 76%;
  animation: drift 4000ms infinite linear;
}

.wave.-three {
  animation: drift 5000ms infinite linear;
  opacity: .4;
  background: #0af;
}

.wave.-two {
  animation: drift 6000ms infinite linear;
  opacity: .4;
  background: yellow;
}
@keyframes drift {
  from { transform: rotate(0deg); }
  from { transform: rotate(360deg); }
}

</style>





<script>
import axios from 'axios';
import { obj } from '../App.vue';
import Navbar from "../components/Navbar";

  export default {
    components:{
      Navbar,
    },
    data: () => ({
        show:false,
        width:2,
        items:[
        ],

      
      value: [
      ],
      value1: [
      ],
      selected:"Select"
    }),
    methods:{
      yearWise() {
          this.show=true;
        this.selected="Year Wise";

        axios
		.post(`${obj.ip}/services/report/year`, {
			token: `${obj.token}`
		})
		.then(
			response => {
			console.log('Got response');
			console.log(response.data);
			this.value1=response.data.year;
      this.value=response.data.count;  
			},
			error => {
				alert(error);
				console.log('Got error');
				obj.token = "";
				console.log(error);
			}
    );
    
    axios
		.post(`${obj.ip}/services/report/table_year`, {
			token: `${obj.token}`
		})
		.then(
			response => {
      console.log(response.data);
      this.items = response.data;
			},
			error => {
				alert(error);
				console.log('Got error');
				obj.token = "";
				console.log(error);
			}
		);

      },
      interactionType()  {
        this.show=true;
        this.selected="Interaction Type";

        axios
		.post(`${obj.ip}/services/report/type`, {
			token:`${obj.token}`
		})
		.then(
			response => {
			console.log('Got a valid response');
			console.log(response.data);
			this.value1=[];
			this.value=response.data.count;
			},
			error => {
				console.log('Error');
				console.log(response.data);
				alert(error);
				obj.token = "";
				console.log(error);
			}
    );
    	axios
		.post(`${obj.ip}/services/report/table_type`, {
			token:`${obj.token}`
		})
		.then(
			response => {
      console.log(response.data);
      this.items = response.data;
			},
			error => {
				console.log('Error');
				alert(error);
				obj.token = "";
				console.log(error);
			}
		);
      },
      numberDays()  {
          this.show=true;
        this.selected="Number of Days";

		axios
		.post(`${obj.ip}/services/report/duration`, {
			token: `${obj.token}`
		})
		.then(
			response => {
			console.log('Got valid response');
			console.log(response.data);
			this.value1=response.data.duration;
			this.value=response.data.count;
			},
			error => {
				alert(error);
				console.log('Got an error');
				obj.token = "";
				console.log(error);
			}
		);
      axios
		.post(`${obj.ip}/services/report/table_duration`, {
			token: `${obj.token}`
		})
		.then(
			response => {
      console.log(response.data);
      this.items = response.data;
			},
			error => {
				alert(error);
				console.log('Got an error');
				obj.token = "";
				console.log(error);
			}
		);
      }
    }
  }
</script>