/**************************
ROS HEADER
**************************/
#include <ros/ros.h>
#include <sensor_msgs/CompressedImage.h>
#include <ros/callback_queue.h>
/**************************
STD HEADER
**************************/
#include <stdio.h>
#include <vector>
#include <sstream>
#include <iostream>
#include <fstream>

/**************************
tf HEADER
**************************/
#include <tf/transform_broadcaster.h>
#include <tf/transform_datatypes.h>
/**************************
OpenCV HEADER
**************************/
#include "cv_bridge/cv_bridge.h"
#include "opencv2/core/core.hpp"
#include "opencv2/aruco.hpp"
#include "opencv2/opencv.hpp"
#include "opencv2/imgcodecs.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/calib3d.hpp"

using namespace cv;
using namespace std;




void Image_process(const sensor_msgs::Image::ConstPtr& msg){

    double fx,fy,cx,cy,k1,k2,k3,p1,p2;
    fx=540.462622;
    fy=540.448667;
    cx=321.209797;
    cy=248.175096;
    k1=0.041615;
    k2=-0.113986;
    k3=0;
    p1=0.006056;
    p2=0.005122;
    cv_bridge::CvImagePtr cv_ptr;
    Mat cameraMatrix = (cv::Mat_<float>(3, 3) <<    fx, 0.0, cx,
                                                    0.0, fy, cy,
                                                    0.0, 0.0, 1.0);

    Mat distCoeffs = (cv::Mat_<float>(5, 1) << k1, k2, p1, p2, k3);
    
    static tf::TransformBroadcaster br;
    tf::Transform transform;

    try{
        cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e){
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
    }

    namedWindow("Aruco_detector", CV_WINDOW_AUTOSIZE);
    Mat image, image_copy;
    image = cv_ptr->image;
    image.copyTo(image_copy);
   //imshow("image",image);
   
   vector<int> markerIds;
   vector< vector< Point2f > > markerCorners, rejectedCandidates;
   Ptr<aruco::DetectorParameters> parameters = aruco::DetectorParameters::create();
   Ptr<aruco::Dictionary> dictionary = aruco::getPredefinedDictionary(aruco::PREDEFINED_DICTIONARY_NAME::DICT_4X4_50);
   aruco::detectMarkers(image, dictionary, markerCorners, markerIds, parameters, rejectedCandidates);
   if(markerIds.size() > 0){
       ROS_INFO("get markers");
       aruco::drawDetectedMarkers(image_copy, markerCorners, markerIds);
       std::vector<cv::Vec3d> rvecs, tvecs;
       aruco::estimatePoseSingleMarkers(markerCorners, 0.05, cameraMatrix, distCoeffs, rvecs, tvecs);//求解旋转矩阵rvecs和平移矩阵tvecs
       for(int i=0; i<markerIds.size(); i++){
               aruco::drawAxis(image_copy, cameraMatrix, distCoeffs, rvecs[i], tvecs[i], 0.1);
               ROS_INFO("R: %f, T: %f", rvecs[i][0], tvecs[i][0]);
               transform.setOrigin(tf::Vector3(tvecs[0][0],tvecs[0][1],tvecs[0][2]));
               tf::Quaternion q;
               q.setRPY(rvecs[0][0],rvecs[0][1],rvecs[0][2]);
               transform.setRotation(q);
               br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "/Marker", "/camera_rgb_frame"));

       }
   }
   else{
       ROS_INFO("NO markers");

   }
   imshow("out", image_copy);
   waitKey(10);
    
}


void createArucoMarkers(){

    Mat outputMarker;

    Ptr<aruco::Dictionary> markerDicitonary = aruco::getPredefinedDictionary(aruco::PREDEFINED_DICTIONARY_NAME::DICT_4X4_50);

    for(int i=0; i<50; i++){
        aruco::drawMarker(markerDicitonary, i, 500, outputMarker, 1);
        ostringstream convert;
        string imageName = "4X4Marker_";
        convert << imageName << i << ".jpg";
        imwrite(convert.str(), outputMarker);
    }

}

//void createKnownBoardPosition()

int main(int argc, char** argv){
    
    ros::init(argc, argv, "aruco_detector");
    ros::NodeHandle n;  
    ros::Subscriber image_sub = n.subscribe("/camera/rgb/image_rect_color", 10, &Image_process);
    ros::Rate r(20);
    while(ros::ok()){
        ros::spinOnce();
        r.sleep();
    }

    //createArucoMarkers();

    return 0;    
    

    


}