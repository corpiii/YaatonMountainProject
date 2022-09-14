//
//  MountainManager.swift
//  YaatonMountainProject
//
//  Created by 이정민 on 2022/09/14.
//

import UIKit

enum MountainData {
    static let koreanMountain: [Mountain] = [
        Mountain(name: "한라산", height: "1,947m", image: UIImage(named: "한라산"), description: "한라산은 대한민국 제주도 중앙부에 있는 해발 1,947.06m, 면적 약 1,820km²의 화산으로, 제주도의 면적 대부분을 차지하고 있다. 정상에 백록담이라는 화산호가 있는데, 백록담이라는 이름은 흰 사슴이 물을 먹는 곳이라는 뜻에서 왔다고 전해진다."),
        Mountain(name: "지리산", height: "1,915m", image: UIImage(named: "지리산"), description: "지리산은 경상남도의 하동군, 함양군, 산청군, 전라남도의 구례군, 전라북도의 남원시 등 3개 도, 5개 시군에 걸쳐있는 산이다. 1967년 최초의 대한민국의 국립공원으로 지정되었으며 대한민국에서는 483.022㎢의 가장 넓은 면적을 지닌 산악형 국립공원이다"),
        Mountain(name: "북한산", height: "836m", image: UIImage(named: "북한산"), description: "북한산은 서울특별시 강북구·도봉구·은평구·성북구·종로구와 경기도 고양시 덕양구·양주시·의정부시의 경계에 있는 높이 835.6m의 산으로, 이름은 조선 후기시대때 한성의 북쪽이라는 뜻에서 유래되었다. ")
    ]
    
    static let foreignMountain: [Mountain] = [
        Mountain(name: "백두산", height: "2,744m", image: UIImage(named: "백두산"), description: "백두산은 조중 국경에 있는 화산이다. 중국에서는 장백산이라 불린다. 한민족에게는 민족의 영산으로 숭앙되어 왔으며, 환웅이 무리 3,000명을 이끌고 제사를 열었다는 태백산과 동일시되기도 한다. 높이는 2,744m로, 한반도에서 가장 높은 산이다."),
        Mountain(name: "에베레스트산", height: "8,848m", image: UIImage(named: "에베레스트"), description: "에베레스트산은 높이가 해발 8,848.86 m로 지구에서 가장 높은 산이다. 네팔에서는 사가르마타라 부르고, 티베트어로는 초모랑마, 중국어에서는 티베트어 '초모랑마'를 그대로 차용해 주무랑마봉이라고 부른다. '에베레스트'는 영국의 조지 에버리스트 경의 이름을 따서 붙여졌다."),
        Mountain(name: "킬리만자로산", height: "5,895m", image: UIImage(named: "킬리만자로"), description: "킬리만자로산은 탄자니아 북동부에 있는 성층 화산이다. 정상인 우후루 피크의 높이는 5,895m로 아프리카 대륙에서 가장 높으며, 지형학에서는 세계에서 네 번째로 돌출된 산이다. 킬리만자로의 뜻은 스와힐리어로 빛나는 산 혹은 하얀 산이다.")
    ]
}
