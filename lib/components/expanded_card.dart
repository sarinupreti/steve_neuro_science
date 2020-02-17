import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steve_beaudoin/components/shimmer.dart';
import 'package:steve_beaudoin/screens/topic_details/details_page.dart';

typedef NavigateTo(String item);

class ExpandedCard extends StatefulWidget {
  final String title;

  final Color backgroundColor;
  final Color titleColor;
  final List<dynamic> subTopics;
  final String assetId;
  final bool isActive;
  final Color gradientColor;
  final String imageUrl;

  ExpandedCard(
      {this.title,
      this.backgroundColor,
      this.titleColor,
      this.subTopics,
      this.isActive,
      this.assetId,
      Key key,
      this.gradientColor,
      this.imageUrl})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SectionState();
}

/// This [State] uses the [SingleTickerProviderStateMixin] to add [vsync] to it.
/// This allows the animation to run smoothly and avoids consuming unnecessary resources.
class _SectionState extends State<ExpandedCard>
    with SingleTickerProviderStateMixin {
  /// The [AnimationController] is a Flutter Animation object that generates a new value
  /// whenever the hardware is ready to draw a new frame.
  AnimationController _controller;

  /// Since the above object interpolates only between 0 and 1, but we'd rather apply a curve to the current
  /// animation, we're providing a custom [Tween] that allows to build more advanced animations, as seen in [initState()].
  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );

  /// The [Animation] object itself, which is required by the [SizeTransition] widget in the [build()] method.
  Animation<double> _sizeAnimation;

  /// Detects which state the widget is currently in, and triggers the animation upon change.
  bool _isExpanded = false;

  /// Here we initialize the fields described above, and set up the widget to its initial state.
  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    /// This curve is controlled by [_controller].
    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    /// [_sizeAnimation] will interpolate using this curve - [Curves.fastOutSlowIn].
    _sizeAnimation = _sizeTween.animate(curve);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Whenever a tap is detected, toggle a change in the state and move the animation forward
  /// or backwards depending on the initial status.
  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    switch (_sizeAnimation.status) {
      case AnimationStatus.completed:
        _controller.reverse();
        break;
      case AnimationStatus.dismissed:
        _controller.forward();
        break;
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
  }

  /// This method wraps the whole widget in a [GestureDetector] to handle taps appropriately.
  ///
  /// A custom [BoxDecoration] is used to render the rounded rectangle on the screen, and a
  /// [MenuVignette] is used as a background decoration for the whole widget.
  ///
  /// The [SizeTransition] opens up the section and displays the list underneath the section title.
  ///
  /// Each section sub-element is wrapped into a [GestureDetector] too so that the Timeline can be displayed
  /// when that element is tapped.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.subTopics != null) {
            _toggleExpand();
          }
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: widget.backgroundColor),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      left: 0,
                      top: 0,
                      child: CachedNetworkImage(
                        imageUrl: widget.imageUrl ?? "",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken)),
                          ),
                        ),
                        placeholder: (context, url) => CustomShimmer(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Column(children: <Widget>[
                      Container(
                          height: 150.0,
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 21.0,
                                width: 21.0,
                                margin: EdgeInsets.all(18.0),
                                child: Icon(
                                  _isExpanded
                                      ? Icons.remove_circle_outline
                                      : Icons.add_circle,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                widget.title,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            widget.titleColor ?? Colors.white)),
                              )
                            ],
                          )),
                      SizeTransition(
                          axisAlignment: 0.0,
                          axis: Axis.vertical,
                          sizeFactor: _sizeAnimation,
                          child: Container(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.subTopics.map((subTopics) {
                              return SubTopicList(
                                data: Map<String, dynamic>.from(subTopics),
                              );
                            }).toList(),
                          )))
                    ]),
                  ],
                ))));
  }
}

class SubTopicList extends StatefulWidget {
  final Map<String, dynamic> data;

  const SubTopicList({Key key, this.data}) : super(key: key);

  @override
  _SubTopicListState createState() => _SubTopicListState();
}

class _SubTopicListState extends State<SubTopicList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(subTopics: widget.data)));
                },
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                              child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: Text(widget.data["subTopicTitle"] ?? "",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            )),
                      ))),
                      Container(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 22.0,
                          ))
                    ]))
          ],
        ));
  }
}
