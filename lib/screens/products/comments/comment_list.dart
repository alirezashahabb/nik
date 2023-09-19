import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeshop/data/repositroy/comemnt_repositroy.dart';
import 'package:nikeshop/model/comment.dart';
import 'package:nikeshop/screens/products/comments/bloc/comment_bloc.dart';
import 'package:nikeshop/theme.dart';
import 'package:nikeshop/utils/error.dart';

class CommentList extends StatelessWidget {
  final int productId;
  const CommentList({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = CommentBloc(commentRepositroy, productId);
        bloc.add(CommentInitEvent());
        return bloc;
      },
      child: BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
        if (state is CommentSuccsessState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CommentItems(data: state.comments[index]),
              childCount: state.comments.length,
            ),
          );
        } else if (state is CommentLoadingState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CommentErrorState) {
          return SliverToBoxAdapter(
            child: ErorrButtom(
              exption: state.exption,
              onTap: () {
                BlocProvider.of<CommentBloc>(context).add(CommentInitEvent());
              },
            ),
          );
        } else {
          throw Exception('stat is Not Supports');
        }
      }),
    );
  }
}

class CommentItems extends StatelessWidget {
  final CommentEntity data;
  const CommentItems({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: LightThemColor.secoundrTextColor,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title),
                    Text(
                      data.email,
                      style: theme.textTheme.bodySmall,
                    )
                  ],
                ),
                Text(
                  data.date,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            Text(data.content),
          ],
        ));
  }
}
