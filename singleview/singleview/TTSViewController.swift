//
//  TTSViewController.swift
//  BabyName
//
//  Created by Park Jung Gyu on 23/04/2016.
//  Copyright © 2016 pyfamily. All rights reserved.
//

import UIKit
import AVFoundation

class TTSViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var firstNameK: UITextField!
    @IBOutlet weak var firstNameE: UILabel!
    
    // keyboard should disappear
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func SayName(sender: UIButton)
    {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: firstName.text!)
        utterance.rate = 0.3
        // utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
        synthesizer.speakUtterance(utterance)
    }

    @IBAction func translateEng(sender: UIButton)
    {
        var str: String = ""
        
        if let fname = firstNameK.text {
            if fname.characters.count > 0 {
                for i in  0..<fname.characters.count {
                    let index = fname.startIndex.advancedBy(i)
                    let s = String(fname[index])
                    if let k = han_to_eng[s] {
                        str += k
                    }
                    else {
                        return
                    }
                }
                firstNameE.text = str
            }
            else {
                return
            }
        }
    }

}

let han_to_eng: [String:String] = [
"가":"ga",
"각":"gak",
"간":"gan",
"갈":"gal",
"감":"gam",
"갑":"gap",
"갓":"gat",
"강":"gang",
"개":"gae",
"객":"gaek",
"거":"geo",
"건":"geon",
"걸":"geol",
"검":"geom",
"겁":"geop",
"게":"ge",
"겨":"gyeo",
"격":"gyeok",
"견":"gyeon",
"결":"gyeol",
"겸":"gyeom",
"겹":"gyeop",
"경":"gyeong",
"계":"gye",
"고":"go",
"곡":"gok",
"곤":"gon",
"골":"gol",
"곳":"got",
"공":"gong",
"곶":"got",
"과":"gwa",
"곽":"gwak",
"관":"gwan",
"괄":"gwal",
"광":"gwang",
"괘":"gwae",
"괴":"goe",
"굉":"goeng",
"교":"gyo",
"구":"gu",
"국":"guk",
"군":"gun",
"굴":"gul",
"굿":"gut",
"궁":"gung",
"권":"gwon",
"궐":"gwol",
"귀":"gwi",
"규":"gyu",
"균":"gyun",
"귤":"gyul",
"그":"geu",
"극":"geuk",
"근":"geun",
"글":"geul",
"금":"geum",
"급":"geup",
"긍":"geung",
"기":"gi",
"긴":"gin",
"길":"gil",
"김":"gim",
"까":"kka",
"깨":"kkae",
"꼬":"kko",
"꼭":"kkok",
"꽃":"kkot",
"꾀":"kkoe",
"꾸":"kku",
"꿈":"kkum",
"끝":"kkeut",
"끼":"kki",
"나":"na",
"낙":"nak",
"난":"nan",
"날":"nal",
"남":"nam",
"납":"nap",
"낭":"nang",
"내":"nae",
"냉":"naeng",
"너":"neo",
"널":"neol",
"네":"ne",
"녀":"nyeo",
"녁":"nyeok",
"년":"nyeon",
"념":"nyeom",
"녕":"nyeong",
"노":"no",
"녹":"nok",
"논":"non",
"놀":"nol",
"농":"nong",
"뇌":"noe",
"누":"nu",
"눈":"nun",
"눌":"nul",
"느":"neu",
"늑":"neuk",
"늠":"neum",
"능":"neung",
"늬":"nui",
"니":"ni",
"닉":"nik",
"닌":"nin",
"닐":"nil",
"님":"nim",
"다":"da",
"단":"dan",
"달":"dal",
"담":"dam",
"답":"dap",
"당":"dang",
"대":"dae",
"댁":"daek",
"더":"deo",
"덕":"deok",
"도":"do",
"독":"dok",
"돈":"don",
"돌":"dol",
"동":"dong",
"돼":"dwae",
"되":"doe",
"된":"doen",
"두":"du",
"둑":"duk",
"둔":"dun",
"뒤":"dwi",
"드":"deu",
"득":"deuk",
"들":"deul",
"등":"deung",
"디":"di",
"따":"tta",
"땅":"ttang",
"때":"ttae",
"또":"tto",
"뚜":"ttu",
"뚝":"ttuk",
"뜨":"tteu",
"띠":"tti",
"라":"ra",
"락":"rak",
"란":"ran",
"람":"ram",
"랑":"rang",
"래":"rae",
"랭":"raeng",
"량":"ryang",
"렁":"reong",
"레":"re",
"려":"ryeo",
"력":"ryeok",
"련":"ryeon",
"렬":"ryeol",
"렴":"ryeom",
"렵":"ryeop",
"령":"ryeong",
"례":"rye",
"로":"ro",
"록":"rok",
"론":"ron",
"롱":"rong",
"뢰":"roe",
"료":"ryo",
"룡":"ryong",
"루":"ru",
"류":"ryu",
"륙":"ryuk",
"륜":"ryun",
"률":"ryul",
"륭":"ryung",
"르":"reu",
"륵":"reuk",
"른":"reun",
"름":"reum",
"릉":"reung",
"리":"ri",
"린":"rin",
"림":"rim",
"립":"rip",
"마":"ma",
"막":"mak",
"만":"man",
"말":"mal",
"망":"mang",
"매":"mae",
"맥":"maek",
"맨":"maen",
"맹":"maeng",
"머":"meo",
"먹":"meok",
"메":"me",
"며":"myeo",
"멱":"myeok",
"면":"myeon",
"멸":"myeol",
"명":"myeong",
"모":"mo",
"목":"mok",
"몰":"mol",
"못":"mot",
"몽":"mong",
"뫼":"moe",
"묘":"myo",
"무":"mu",
"묵":"muk",
"문":"mun",
"물":"mul",
"므":"meu",
"미":"mi",
"민":"min",
"밀":"mil",
"바":"ba",
"박":"bak",
"반":"ban",
"발":"bal",
"밥":"bap",
"방":"bang",
"배":"bae",
"백":"baek",
"뱀":"baem",
"버":"beo",
"번":"beon",
"벌":"beol",
"범":"beom",
"법":"beop",
"벼":"byeo",
"벽":"byeok",
"변":"byeon",
"별":"byeol",
"병":"byeong",
"보":"bo",
"복":"bok",
"본":"bon",
"봉":"bong",
"부":"bu",
"북":"buk",
"분":"bun",
"불":"bul",
"붕":"bung",
"비":"bi",
"빈":"bin",
"빌":"bil",
"빔":"bim",
"빙":"bing",
"빠":"ppa",
"빼":"ppae",
"뻐":"ppeo",
"뽀":"ppo",
"뿌":"ppu",
"쁘":"ppeu",
"삐":"ppi",
"사":"sa",
"삭":"sak",
"산":"san",
"살":"sal",
"삼":"sam",
"삽":"sap",
"상":"sang",
"샅":"sat",
"새":"sae",
"색":"saek",
"생":"saeng",
"서":"seo",
"석":"seok",
"선":"seon",
"설":"seol",
"섬":"seom",
"섭":"seop",
"성":"seong",
"세":"se",
"셔":"syeo",
"소":"so",
"속":"sok",
"손":"son",
"솔":"sol",
"솟":"sot",
"송":"song",
"쇄":"swae",
"쇠":"soe",
"수":"su",
"숙":"suk",
"순":"sun",
"술":"sul",
"숨":"sum",
"숭":"sung",
"쉬":"swi",
"스":"seu",
"슬":"seul",
"슴":"seum",
"습":"seup",
"승":"seung",
"시":"si",
"식":"sik",
"신":"sin",
"실":"sil",
"심":"sim",
"십":"sip",
"싱":"sing",
"싸":"ssa",
"쌍":"ssang",
"쌔":"ssae",
"쏘":"sso",
"쑥":"ssuk",
"씨":"ssi",
"아":"a",
"악":"ak",
"안":"an",
"알":"al",
"암":"am",
"압":"ap",
"앙":"ang",
"앞":"ap",
"애":"ae",
"액":"aek",
"앵":"aeng",
"야":"ya",
"약":"yak",
"얀":"yan",
"양":"yang",
"어":"eo",
"억":"eok",
"언":"eon",
"얼":"eol",
"엄":"eom",
"업":"eop",
"에":"e",
"여":"yeo",
"역":"yeok",
"연":"yeon",
"열":"yeol",
"염":"yeom",
"엽":"yeop",
"영":"yeong",
"예":"ye",
"오":"o",
"옥":"ok",
"온":"on",
"올":"ol",
"옴":"om",
"옹":"ong",
"와":"wa",
"완":"wan",
"왈":"wal",
"왕":"wang",
"왜":"wae",
"외":"oe",
"왼":"oen",
"요":"yo",
"욕":"yok",
"용":"yong",
"우":"u",
"욱":"uk",
"운":"un",
"울":"ul",
"움":"um",
"웅":"ung",
"워":"wo",
"원":"won",
"월":"wol",
"위":"wi",
"유":"yu",
"육":"yuk",
"윤":"yun",
"율":"yul",
"융":"yung",
"윷":"yut",
"으":"eu",
"은":"eun",
"을":"eul",
"음":"eum",
"읍":"eup",
"응":"eung",
"의":"ui",
"이":"i",
"익":"ik",
"인":"in",
"일":"il",
"임":"im",
"입":"ip",
"잉":"ing",
"자":"ja",
"작":"jak",
"잔":"jan",
"잠":"jam",
"잡":"jap",
"장":"jang",
"재":"jae",
"쟁":"jaeng",
"저":"jeo",
"적":"jeok",
"전":"jeon",
"절":"jeol",
"점":"jeom",
"접":"jeop",
"정":"jeong",
"제":"je",
"조":"jo",
"족":"jok",
"존":"jon",
"졸":"jol",
"종":"jong",
"좌":"jwa",
"죄":"joe",
"주":"ju",
"죽":"juk",
"준":"jun",
"줄":"jul",
"중":"jung",
"쥐":"jwi",
"즈":"jeu",
"즉":"jeuk",
"즐":"jeul",
"즘":"jeum",
"즙":"jeup",
"증":"jeung",
"지":"ji",
"직":"jik",
"진":"jin",
"질":"jil",
"짐":"jim",
"집":"jip",
"징":"jing",
"짜":"jja",
"째":"jjae",
"쪼":"jjo",
"찌":"jji",
"차":"cha",
"착":"chak",
"찬":"chan",
"찰":"chal",
"참":"cham",
"창":"chang",
"채":"chae",
"책":"chaek",
"처":"cheo",
"척":"cheok",
"천":"cheon",
"철":"cheol",
"첨":"cheom",
"첩":"cheop",
"청":"cheong",
"체":"che",
"초":"cho",
"촉":"chok",
"촌":"chon",
"총":"chong",
"최":"choe",
"추":"chu",
"축":"chuk",
"춘":"chun",
"출":"chul",
"춤":"chum",
"충":"chung",
"측":"cheuk",
"층":"cheung",
"치":"chi",
"칙":"chik",
"친":"chin",
"칠":"chil",
"침":"chim",
"칩":"chip",
"칭":"ching",
"코":"ko",
"쾌":"kwae",
"크":"keu",
"큰":"keun",
"키":"ki",
"타":"ta",
"탁":"tak",
"탄":"tan",
"탈":"tal",
"탐":"tam",
"탑":"tap",
"탕":"tang",
"태":"tae",
"택":"taek",
"탱":"taeng",
"터":"teo",
"테":"te",
"토":"to",
"톤":"ton",
"톨":"tol",
"통":"tong",
"퇴":"toe",
"투":"tu",
"퉁":"tung",
"튀":"twi",
"트":"teu",
"특":"teuk",
"틈":"teum",
"티":"ti",
"파":"pa",
"판":"pan",
"팔":"pal",
"패":"pae",
"팽":"paeng",
"퍼":"peo",
"페":"pe",
"펴":"pyeo",
"편":"pyeon",
"폄":"pyeom",
"평":"pyeong",
"폐":"pye",
"포":"po",
"폭":"pok",
"표":"pyo",
"푸":"pu",
"품":"pum",
"풍":"pung",
"프":"peu",
"피":"pi",
"픽":"pik",
"필":"pil",
"핍":"pip",
"하":"ha",
"학":"hak",
"한":"han",
"할":"hal",
"함":"ham",
"합":"hap",
"항":"hang",
"해":"hae",
"핵":"haek",
"행":"haeng",
"향":"hyang",
"허":"heo",
"헌":"heon",
"험":"heom",
"헤":"he",
"혀":"hyeo",
"혁":"hyeok",
"현":"hyeon",
"혈":"hyeol",
"혐":"hyeom",
"협":"hyeop",
"형":"hyeong",
"혜":"hye",
"호":"ho",
"혹":"hok",
"혼":"hon",
"홀":"hol",
"홉":"hop",
"홍":"hong",
"화":"hwa",
"확":"hwak",
"환":"hwan",
"활":"hwal",
"황":"hwang",
"홰":"hwae",
"횃":"hwaet",
"회":"hoe",
"획":"hoek",
"횡":"hoeng",
"효":"hyo",
"후":"hu",
"훈":"hun",
"훤":"hwon",
"훼":"hwe",
"휘":"hwi",
"휴":"hyu",
"휼":"hyul",
"흉":"hyung",
"흐":"heu",
"흑":"heuk",
"흔":"heun",
"흘":"heul",
"흠":"heum",
"흡":"heup",
"흥":"heung",
"희":"hui",
"흰":"huin",
"히":"hi",
"힘":"him"]