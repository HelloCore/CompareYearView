import React from "react";
import { createStackNavigator } from "react-navigation";
import HomePage from "./HomePage";
import YearViewPage from "./YearViewPage";

export default createStackNavigator({
  Home: {
    screen: HomePage,
    navigationOptions: {
      title: "Home"
    }
  },
  YearView: {
    screen: YearViewPage,
    navigationOptions: {
      title: "YearView"
    }
  }
});
