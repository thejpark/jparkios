//
//  HeadsUpCarView.swift
//  NewFeatures
//
//  Created by Kaushal on 25/5/2022.
//

import SwiftUI

struct HeadsUpCarView: View {
  @State private var surName: String = ""
  @State private var gender: String = ""
  @State private var birthPlace: String = ""
  @State private var dob: String = ""
    var body: some View {
      VStack(alignment: .leading) {
        Image("hawaii")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: 70)
          .padding(.all, 0)
        Spacer(minLength: 40)
        VStack(alignment: .leading) {
        Text("출생등록정보")
          .font(.title)
          .bold()
          .multilineTextAlignment(.leading)

        Spacer(minLength: 20)
          Text(surName)
          .font(.body)
          .multilineTextAlignment(.leading)
          Text(gender)
          .font(.body)
          .multilineTextAlignment(.leading)
          Text(birthPlace)
          .font(.body)
          .multilineTextAlignment(.leading)
          Text(dob)
          .font(.body)
          .multilineTextAlignment(.leading)
          Spacer(minLength: 40)
//          Text("Sydney shipit flights info ✈️")
//            .font(.subheadline)
//          Text("1 week ago")
//            .font(.caption)
        }.padding()
        .onAppear() {
          self.surName = "성: " + RegisterInfo.obj.surName + "(" + RegisterInfo.obj.surNameHanja + ")"
          self.gender = "성별: " + RegisterInfo.obj.gender.rawValue
          self.birthPlace = "출생지: " + RegisterInfo.obj.birthPlace.rawValue
          let dob = getStringFromDate(RegisterInfo.obj.datetime)
          let str = dob.components(separatedBy: " ")
          self.dob = "시간 : " + str[0] + "년 " + str[1] + "월 " + str[2] + "일 " + str[3] + "시 " + str[4] + "분"
        }

      }
    }

}

struct HeadsUpCarView_Previews: PreviewProvider {
    static var previews: some View {
        HeadsUpCarView()
    }
}
