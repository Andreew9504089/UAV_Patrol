var app = new Vue({
    el:'#control_gui',
    data: {
        connected: false,
        failure: false,
        ros: null,
        uav_port: '9090',
        uav_ip: '0.0.0.0',
        logs: [],
        control_signal: null,
        destination: '',
        direction: 1,
        cruise_height: 1,
        hover_time: 15,
        unlocked: false,
    },
    methods: {
        connect: function(){
            console.log('Connecting...')

            this.ros = new ROSLIB.Ros({
                url: 'ws://' + this.uav_ip + ':' + this.uav_port
            })

            this.ros.on('connection', () => {
                document.getElementById("unlock").disabled = false;
                document.getElementById("dest").disabled = true;

                
                this.logs.unshift((new Date()).toTimeString() + ' - connected')
                this.connected = true
                this.failure = false
                console.log('Connected')

                document.getElementById("left_btn").disabled = false;
                document.getElementById("right_btn").disabled = false;

                // Create a control signal publisher: default 0, take off 1, return 2, Land 3, Start_flight 4
                this.control_pub = new ROSLIB.Topic({
                    ros: this.ros,
                    name: '/control_phase',
                    messageType: 'std_msgs/Int8'
                });

                this.control_signal = new ROSLIB.Message({
                    data: 0
                })

                this.control_pub.publish(this.control_signal)
                this.logs.unshift((new Date()).toTimeString() + 'Default Mode')

                this.id_sub = new ROSLIB.Topic({
                    ros: this.ros,
                    name: '/id',
                    messageType: 'std_msgs/Int8'
                })
        
                this.id_sub.subscribe(function(message){
                    document.getElementById("uav_id").innerHTML = message.data;
                    this.id_sub.unsubscribe();
                })

                this.status_sub = new ROSLIB.Topic({
                    ros: this.ros,
                    name: '/status',
                    messageType: 'std_msgs/String'
                })
        
                this.status_sub.subscribe(function(message){
                    document.getElementById("uav_status").innerHTML = message.data;
                })
                
                this.location_sub = new ROSLIB.Topic({
                    ros: this.ros,
                    name: '/location',
                    messageType: 'std_msgs/Int8'
                })
        
                this.location_sub.subscribe(function(message){
                    document.getElementById("uav_location").innerHTML = message.data;
                })

                this.height_sub = new ROSLIB.Topic({
                    ros: this.ros,
                    name: '/flight_height',
                    messageType: 'std_msgs/Int8'
                })
        
                this.height_sub.subscribe(function(message){
                    document.getElementById("uav_height").innerHTML = message.data;
                })

                this.status_sub = new ROSLIB.Topic({
                    ros: this.ros,
                    name: '/status',
                    messageType: 'std_msgs/String'
                })
        
                this.status_sub.subscribe(function(message){
                    document.getElementById("uav_status").innerHTML = message.data;
                })

                this.busy_sub = new ROSLIB.Topic({
                    ros: this.ros,
                    name: '/busy',
                    messageType: 'std_msgs/Bool'
                })
        
                this.busy_sub.subscribe(function(message){
                    console.log(message.data);
                    if(message.data){
                        document.getElementById("indicator").classList.replace("led-green", "led-red");
                    }else{
                        document.getElementById("indicator").classList.replace("led-red", "led-green");
                    }
                })

                document.getElementById("cam_topic").style.display = "block";
                document.getElementById("mjpeg").style.display = "block";
                this.showCamera()
            })
            this.ros.on('error', (error) => {
                this.failure = true
                this.logs.unshift((new Date()).toTimeString() + ' - Cannot establish connection with server')
                console.log('Connection Failed', error)
            })
            this.ros.on('close', () => {
                if(!(this.failure)){
                    this.logs.unshift((new Date()).toTimeString() + ' - disconnected')
                    this.connected = false
                    console.log('Connection Closed')
                    this.unlocked = false
                    document.getElementById("unlock").disabled = true;
                }   
            })
        },

        disconnect: function(){
			delete this.cameraViewer;
            this.ros.close()
            this.connected = false
            console.log('Connection Closed')
            document.getElementById("cam_topic").style.display = "none";
            document.getElementById("mjpeg").style.display = "none";
        },

        showCamera: function(){
            console.log('set camera method')

            const image_port = parseInt(this.ws_address, 10) - 1010
            
            this.cameraViewer = new MJPEGCANVAS.Viewer({
                divID: 'mjpeg',
                host: '0.0.0.0',
                width: 640,
                height: 480,
                topic: '/iris1/camera_forward/color/image_raw',
                port: image_port,
            })

            document.getElementById("cam_topic").innerHTML = '/iris1/camera_forward/color/image_raw';
        },

        takeoff: function(){
            console.log('UAV takeoff')
            this.logs.unshift((new Date()).toTimeString() + 'UAV takeoff')

            //TODO
            /* Publish Takeoff signal */
            // Create a control signal publisher: default 0, take off 1, return 2, Land 3, Start_flight 4
            this.control_signal = new ROSLIB.Message({
                data: 1
            })

            this.control_pub.publish(this.control_signal)

            document.getElementById("btn_land").disabled = false;
            document.getElementById("btn_return").disabled = true;
            document.getElementById("btn_take_off").disabled = true;
            document.getElementById("dest").disabled = false;

        },

        returning: function(){
            console.log('uav returning')
            this.logs.unshift((new Date()).toTimeString() + 'UAV returning')
            
            //TODO
            /* Publish uav landing signal */
            // Create a control signal publisher: default 0, take off 1, return 2, Land 3, Start_flight 4
            this.control_signal = new ROSLIB.Message({
                data: 2
            })

            this.control_pub.publish(this.control_signal)

            document.getElementById("btn_land").disabled = false;
            document.getElementById("btn_return").disabled = true;
            document.getElementById("btn_take_off").disabled = true;
        },

        landing: function(){
            console.log('uav landing')
            this.logs.unshift((new Date()).toTimeString() + 'UAV Landing')
            //TODO
            /*Send emergency stop signal (LAND DIRECTLY)*/
            // Create a control signal publisher: default 0, take off 1, return 2, Land 3, Start_flight 4
            this.control_signal = new ROSLIB.Message({
                data: 3
            })

            this.control_pub.publish(this.control_signal)

            document.getElementById("btn_land").disabled = true;
            document.getElementById("btn_return").disabled = true;
            document.getElementById("btn_take_off").disabled = false;
            document.getElementById("dest").disabled = true;
            document.getElementById("dest").innerHTML = '';
        },

        startFlight: function(){
            //TODO
            /*Send goal point, direction, hover_time & cruise_height*/
            // Create a control signal publisher: default 0, take off 1, return 2, Land 3, Start_flight 4
            this.control_signal = new ROSLIB.Message({
                data: 4
            })

            this.control_pub.publish(this.control_signal)

            const destination = parseInt(this.destination, 10)

            this.dest_pub = new ROSLIB.Topic({
                ros: this.ros,
                name: '/flight_destination',
                messageType: 'std_msgs/Int8'
            });

            var flight_destination = new ROSLIB.Message({
                data: destination
            })

            this.dest_pub.publish(flight_destination)
            this.logs.unshift((new Date()).toTimeString() + 'Flying to tag ' + flight_destination.data)

            document.getElementById("btn_land").disabled = false;
            if(this.destination != 0){
                document.getElementById("btn_return").disabled = false;
            }
            document.getElementById("btn_take_off").disabled = true;
        },

        chooseDirection: function(action){
            if(document.getElementById("left_btn").disabled || document.getElementById("right_btn").disabled){
                document.getElementById("left_btn").disabled = false;
                document.getElementById("right_btn").disabled = false;
            }else{
                switch(action){
                    case "left":
                        this.direction = 0;
                        document.getElementById("left_btn").disabled = false;
                        document.getElementById("right_btn").disabled = true;
                        break;
                    case "right":
                        this.direction = 1;
                        document.getElementById("left_btn").disabled = true;
                        document.getElementById("right_btn").disabled = false;
                        break;
                }
            }

        },

        unlock: function(){
            if(document.getElementById("uav_status").innerHTML == 'Flying' || this.unlocked == false){
                document.getElementById("btn_take_off").disabled = true;
                document.getElementById("btn_return").disabled = true;
                document.getElementById("btn_land").disabled = true;
                
            }else if(document.getElementById("uav_status").innerHTML == 'Hovering' && this.unlocked == true){
                document.getElementById("btn_take_off").disabled = true;
                document.getElementById("btn_return").disabled = false;
                document.getElementById("btn_land").disabled = false; 
    
            }else if(document.getElementById("uav_status").innerHTML == 'Standby' && this.unlocked == true){
                document.getElementById("btn_take_off").disabled = false;
                document.getElementById("btn_return").disabled = true;
                document.getElementById("btn_land").disabled = true;                       
            }
        }
    },
    updated(){
        //TODO
        this.id_sub.subscribe(function(message){
            document.getElementById("uav_id").innerHTML = message.data;
            this.id_sub.unsubscribe();
        })

        if(this.destination != '' && this.unlocked == true){
            document.getElementById('btn_start').disabled = false;
        }else{
            document.getElementById("btn_start").disabled = true;
        }  
    },
    mounted(){          
        document.getElementById("btn_take_off").disabled = true;
        document.getElementById("btn_return").disabled = true;
        document.getElementById("btn_land").disabled = true;
        document.getElementById("btn_kill").disabled = true;
        document.getElementById("btn_start").disabled = true;
        document.getElementById("left_btn").disabled = true;
        document.getElementById("right_btn").disabled = true;
        document.getElementById("unlock").disabled = true;

    },
})
