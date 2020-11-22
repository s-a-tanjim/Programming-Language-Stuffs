1. `roscore` => To start ros master
2. `rosrun package_name node_name`  => Run specific node from specific package
3. `rosnode list` => Get list of currently running node
4. `rosnode info node_name` => Get details info of node
5. `rostopic list`  => Get list of active topics
6. `rostopic echo /topic_name` => print content of topics
7. `rostopic info /topic_name` => Info about topic
8. `rostopic type /topic_name`  => Type of topic
rostopic pub /topic_name type args => Publish a message to a topic
rostopic hz /topic_name => Frequency of publishing message

* cd ~/catkin_ws  =>Naviage to catkin workspace
* catkin build package_name => Build a package
    NB: Use catkin build instade of catkin_make
* source devel/setup.bash => After build a new package, update environment 
* caktin clean  => Clean and rebuld project [dont delete source]
* caktin config => See config
* catkin build --cmake-args => Set build type

Clone from git

* git clone "url" 
* ln -s ~/git/file_name ~/catkin_ws/src/  =>Symbolic-link with catkin workspace
  OR clone it to catkin_ws/src
* cd ~/catkin_ws
* catkin build ros_package_template
* source devel/setup.bash
* roslaunch ros_package_template ros_package_template.launch




## Example
1. roscore [Terminal 1]
2. rosrun roscpp_tutorials talker [Terminal 2]
3. rostopic info /chatter
4. rosrun roscpp_tutorials listener [Terminal 3]
4. rostopic pub /chatter std_msgs/String "data: 'Hello'" [Terminal 2]

## Terms
catkin => ROS build system to generate executables, libraries, interfaces