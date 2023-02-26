import 'package:flutterprueba/views/views.dart';
import 'package:flutterprueba/widgets/loading_icon.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesids =[1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {

      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        //add5();
        fetchData();
      }
      /*print("el primer");
      print(scrollController.position.pixels);
      print("el segon");
      print(scrollController.position.maxScrollExtent);*/
    });
  }


  Future fetchData() async{
    if(isLoading) return;
    isLoading = true;
    setState(() {
    });
    await Future.delayed(const Duration(seconds:3));
    add5();
    isLoading=false;
    setState(() {
    });
  }

  void add5(){
      final lastId= imagesids.last;
      imagesids.addAll(
          [1,2,3,4,5].map((e) => lastId + e)
      );
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final sizer = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            ListView.builder(
                controller: scrollController,
                itemCount:imagesids.length,
                itemBuilder: (BuildContext context, int index){
                  return FadeInImage(
                    width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('img/jar-loading.gif'),
                      image: NetworkImage('https://picsum.photos/500/300?images=${imagesids[index]}')
                  );
                }
            ),
            Positioned(
              bottom: 40,
                left: sizer.width*0.5-30,
                child: LoadingIcon()),
          ],
        ),
      ),
    );
  }
}
