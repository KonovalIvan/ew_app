import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/url.dart';
import 'package:ew_app/widgets/fields/add_comment_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ew_app/controllers/tasks/comment_controller.dart';

import '../models/comments_models.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
    required this.comment,
    required this.sendComment,
    required this.updateTaskView,
    this.userAvatarUrl,
  });

  final Comment comment;
  final Function sendComment;
  final Function updateTaskView;
  final String? userAvatarUrl;

  @override
  // ignore: library_private_types_in_public_api
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  final CommentController _commentController = CommentController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _commentController.openHistory(context);
        });
      },
      child: Container(
        width: 312,
        decoration: BoxDecoration(
          color: const Color(0x80C4C4C4),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Visibility(
                  visible: widget.comment.avatar != null,
                  replacement: Image.asset(
                    'assets/images/base_user_profile.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.fill,
                  ),
                  child: Image.network(
                    '$baseUrl${widget.comment.avatar}',
                    width: 25,
                    height: 25,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.comment.description,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.comment.updateDate,
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    _commentController.showHistory == false
                        ? SizedBox(
                            width: double.infinity,
                            child: Transform.rotate(
                              angle: 3.14159,
                              child: SvgPicture.asset(
                                'assets/icons/back.svg',
                                height: 15.0,
                                width: 27.0,
                                alignment: Alignment.bottomLeft,
                              ),
                            ),
                          )
                        : Container(),
                    _commentController.showHistory == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.comment.replies != null)
                                for (var reply in widget.comment.replies!)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                reply.description,
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  reply.updateDate,
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: ClipOval(
                                            child: Visibility(
                                              visible: reply.avatar != null,
                                              replacement: Image.asset(
                                                'assets/images/base_user_profile.png',
                                                width: 25,
                                                height: 25,
                                                fit: BoxFit.fill,
                                              ),
                                              child: Image.network(
                                                '$baseUrl${reply.avatar}',
                                                width: 25,
                                                height: 25,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: AddCommentFieldWidget(
                                  sendComment: widget.sendComment,
                                  updateTaskView: widget.updateTaskView,
                                  commentId: widget.comment.id,
                                  fieldWidth: double.infinity,
                                  userAvatarUrl: widget.userAvatarUrl,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
