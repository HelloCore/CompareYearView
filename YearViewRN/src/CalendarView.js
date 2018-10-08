import React from "react";
import { View, Text } from "react-native";

function getNumberOfDay(month: number, year: number) {
  switch (month) {
    case 1:
      return 31;
    case 2:
      if (year % 4 !== 0) {
        return 28;
      } else if (year % 100 !== 0) {
        return 29;
      } else if (year % 400 !== 0) {
        return 28;
      } else {
        return 29;
      }
    //check year here
    case 3:
      return 31;
    case 4:
      return 30;

    case 5:
      return 31;
    case 6:
      return 30;
    case 7:
      return 31;
    case 8:
      return 31;
    case 9:
      return 30;
    case 10:
      return 31;
    case 11:
      return 30;
    case 12:
      return 31;
  }
  return 0;
}

type Props = {
  year: number,
  month: number
};
class CalendarView extends React.Component<Props> {
  render() {
    const numberOfDay = getNumberOfDay(this.props.month, this.props.year);
    var firstDate = new Date(this.props.year, this.props.month - 1, 1);
    var dateArr = [];
    var tempArr = [];
    var firstIndex = firstDate.getDay() * -1;
    for (var i = firstIndex + 1; i <= numberOfDay; i++) {
      tempArr.push(i);
      if (tempArr.length === 7) {
        dateArr.push(tempArr);
        tempArr = [];
      }
    }
    if (tempArr.length > 0) {
      while (tempArr.length < 7) {
        tempArr.push(-1);
      }
      dateArr.push(tempArr);
      tempArr = [];
    }
    while (dateArr.length < 6) {
      dateArr.push([-1, -1, -1, -1, -1, -1, -1]);
    }

    return (
      <View
        style={{
          flex: 1,
          flexDirection: "column",
          padding: 10,
          justifyContent: "center",
          alignItems: "center"
        }}
      >
        <Text style={{ fontSize: 11, marginBottom: 10 }}>
          {this.props.month}
        </Text>
        {dateArr.map((week, index) => {
          return (
            <View
              key={this.props.year + ":" + this.props.month + ": week" + index}
              style={{
                flexGrow: 1,
                flexDirection: "row"
              }}
            >
              {week.map((day, index) => {
                return (
                  <View
                    key={
                      this.props.year +
                      ":" +
                      this.props.month +
                      ": day" +
                      day +
                      ":" +
                      index
                    }
                    style={{
                      flexGrow: 1
                    }}
                  >
                    <Text
                      style={{
                        textAlign: "center",
                        fontSize: 7,
                        textAlignVertical: "center",
                        color: day > 0 ? "black" : "transparent"
                        // backgroundColor: day > 0 ? "black" : "red"
                      }}
                    >
                      {day > 0 ? day : "12"}
                    </Text>
                  </View>
                );
              })}
            </View>
          );
        })}
      </View>
    );
  }
}

export default CalendarView;
