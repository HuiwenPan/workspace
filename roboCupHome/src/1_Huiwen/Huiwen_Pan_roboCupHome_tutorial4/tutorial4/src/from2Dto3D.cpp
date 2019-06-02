#include <ros/ros.h>
#include <ros/console.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <geometry_msgs/Point.h>
#include <std_msgs/Char.h>
#include <vector>

#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/exact_time.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <tf/transform_listener.h>

#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>


#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>


// PCL specific includes


#include <pcl_ros/point_cloud.h> // enable pcl publishing
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/PCLPointCloud2.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/filters/voxel_grid.h>


//#include <image_geometry/pinhole_camera_model.h>
#include <darknet_ros_msgs/BoundingBox.h>
#include <darknet_ros_msgs/BoundingBoxes.h>

#include <tutorial4/Rect.h>


using namespace std;
using namespace cv;


class From2Dto3D
{

    private:
      //! The node handle
      ros::NodeHandle nh_;
      //! Node handle in the private namespace
      ros::NodeHandle priv_nh_;

      //! Define publishers and subscribers
      ros::Publisher pub_ ;
      ros::Subscriber sub_ ;
      ros::Subscriber sub_Rect_ ;
      //! Define the pointcloud structure and the bounding box local copy
      pcl::PointCloud<pcl::PointXYZ> pc_;
      geometry_msgs::Point center_pub_;
      vector<geometry_msgs::Point> center_;
      vector<darknet_ros_msgs::BoundingBox> BoundingBoxes_;
      //! A tf transform listener if needed
      //tf::TransformListener listener_;


      //------------------ Callbacks -------------------

      //! Process clusters
      void processCloud(const sensor_msgs::PointCloud2ConstPtr& pc);
      //! Process bounding boxes
      void processRect(const darknet_ros_msgs::BoundingBoxesConstPtr& r);


    public:
      //! Subscribes to and advertises topics
      From2Dto3D(ros::NodeHandle nh) : nh_(nh), priv_nh_("~")
      {
        
        // subscribers to the bounding boxes and the point cloud
        // format:
        // sub_name = nh_.subscribe<Type>("topic", queuesize, Function_of_the_class, this);
        sub_ = nh_.subscribe("/xtion/depth_registered/points",10, &From2Dto3D::processCloud, this);
        
        sub_Rect_ = nh_.subscribe("/darknet_ros/bounding_boxes",10, &From2Dto3D::processRect, this);
        // Publishers
        // format:
        //pub_name = nh_.advertise< Type >("topic", queuesize);
        pub_ = nh_.advertise<geometry_msgs::Point>("segmentation/point3D",10);

        ROS_INFO("from2Dto3D initialized ...");

      }

      ~From2Dto3D() {}
};


void From2Dto3D::processCloud(const sensor_msgs::PointCloud2ConstPtr& pc)
{    
    // store local data copy or shared, depending on the messagep
    pcl::fromROSMsg(*pc, pc_);
    
    
    for (auto bbx : center_){
        center_pub_.x = pc_.at(bbx.x,bbx.y).x;
	center_pub_.y = pc_.at(bbx.x,bbx.y).y;
	center_pub_.z = pc_.at(bbx.x,bbx.y).z;
	ROS_INFO("x: %f, y: %f",bbx.x, bbx.y);
        ROS_INFO("x: %f, y: %f, z:%f",center_pub_.x, center_pub_.y, center_pub_.z);
        pub_.publish(center_pub_);
    }
    ROS_INFO("CloudCB&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");

}

void From2Dto3D::processRect(const darknet_ros_msgs::BoundingBoxesConstPtr& r)
{
    // process bounding box and send 3D position to the topic
    // tip: take a look at the pcl::PointXYZRGB structure
    BoundingBoxes_.clear();
    center_.clear();
    for(int index=0; index < r->bounding_boxes.size(); index++){
	
        BoundingBoxes_.push_back(r->bounding_boxes[index]);
	geometry_msgs::Point temp;
	temp.x = (r->bounding_boxes[index].xmin+r->bounding_boxes[index].xmax)/2;
	temp.y = (r->bounding_boxes[index].ymin+r->bounding_boxes[index].ymax)/2;
        center_.push_back(temp);

    }
    //ROS_INFO("RectCB******************************");
    
    
}



int main(int argc, char** argv)
{
    ros::init(argc, argv, "from2Dto3D");
    ros::NodeHandle nh;
    From2Dto3D node(nh);
    ros::spin();
    return 0;
}


