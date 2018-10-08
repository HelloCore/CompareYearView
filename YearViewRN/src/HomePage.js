import React from "react";
import { View, Text, TouchableOpacity } from "react-native";

class HomePage extends React.Component {
  render() {
    return (
      <View>
        <Text>HomePage</Text>
        <TouchableOpacity
          onPress={() => {
            this.props.navigation.navigate("YearView");
          }}
        >
          <Text>Year View</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

export default HomePage;
