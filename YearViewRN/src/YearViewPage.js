import React from "react";
import { View, Text, TouchableOpacity } from "react-native";
import CalendarView from "./CalendarView";

class YearViewPage extends React.Component {
  state = {
    year: 2018
  };
  render() {
    return (
      <View style={{ flexDirection: "column", flex: 1, alignItems: "center" }}>
        <View style={{ flexDirection: "row", height: 30 }}>
          <TouchableOpacity
            onPress={() => {
              this.setState({ year: this.state.year - 1 });
            }}
          >
            <Text>{"<"}</Text>
          </TouchableOpacity>
          <Text>{this.state.year}</Text>
          <TouchableOpacity
            onPress={() => {
              this.setState({ year: this.state.year + 1 });
            }}
          >
            <Text>{">"}</Text>
          </TouchableOpacity>
        </View>
        <View style={{ flexDirection: "row", flex: 1 }}>
          <CalendarView year={this.state.year} month={1} />
          <CalendarView year={this.state.year} month={2} />
          <CalendarView year={this.state.year} month={3} />
        </View>
        <View style={{ flexDirection: "row", flex: 1 }}>
          <CalendarView year={this.state.year} month={4} />
          <CalendarView year={this.state.year} month={5} />
          <CalendarView year={this.state.year} month={6} />
        </View>
        <View style={{ flexDirection: "row", flex: 1 }}>
          <CalendarView year={this.state.year} month={7} />
          <CalendarView year={this.state.year} month={8} />
          <CalendarView year={this.state.year} month={9} />
        </View>
        <View style={{ flexDirection: "row", flex: 1 }}>
          <CalendarView year={this.state.year} month={10} />
          <CalendarView year={this.state.year} month={11} />
          <CalendarView year={this.state.year} month={12} />
        </View>
      </View>
    );
  }
}

export default YearViewPage;
