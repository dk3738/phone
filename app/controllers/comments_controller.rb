class CommentsController < ApplicationController
  before_action :authenticate_user!
 
  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)
    @comment.name = params[:comment][:name]
    
    respond_to do |format|
      if @comment.save
        make_child_comment
        format.html  { redirect_to("#{request.referrer}#comment#{@comment.id}", :notice => '댓글이 작성되었습니다.') }
        
        ## 댓글
        if (@comment.parent_id == nil && @comment.user_id != commentable.user_id)
          # 외부인이 댓글을 쓸 경우 => 글 작성자에게 알림
          if (@comment.user_id != commentable.user_id)
            @new_notification = NewNotification.create! user: commentable.user,
                                                    content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                    link: request.referrer
          end
        ## 대댓글 영역
        elsif (@comment.parent_id != nil && @comment.user_id != commentable.user_id)
          # 외부인이 대댓글을 작성 시 => 댓글 작성자에게 알림이 발송
          if (@comment.user_id != @comment.parent.user_id)
            @new_notification = NewNotification.create! user: @comment.parent.user,
                                                    content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                    link: request.referrer
          
          ## 대댓글 답변자 모두에게 => 알림 발송
          elsif (@comment.parent_id == @comment.parent.id)
            @comment.parent.children.each do |x|
              if (@comment.user_id != x.user_id && x.user_id != commentable.user_id) # 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                            link: request.referrer
              end
            end
          end
          
          # + 외부인이 대댓글을 작성 시 && 댓글 != 게시글 작성자 => 게시글 작성자에게 알림이 발송
          if (@comment.user_id != @comment.parent.user_id && @comment.parent.user_id != commentable.user_id)
            @new_notification = NewNotification.create! user: commentable.user,
                                                    content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                    link: request.referrer
 
          if (@comment.parent_id == @comment.parent.id)
            @comment.parent.children.each do |x|
              if (@comment.user_id != x.user_id && x.user_id != commentable.user_id) # 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                            link: request.referrer
              end
            end
          end
 
          # 댓글 != 게시글 작성자 && 댓글 != 대댓글 작성자 => 게시글 작성자에게 알림이 발송
          elsif (@comment.user_id != commentable.user_id && @comment.parent.user_id != commentable.user_id)
            @new_notification = NewNotification.create! user: commentable.user,
                                                    content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                    link: request.referrer
          end
          
        elsif (@comment.parent_id != nil && @comment.user_id == commentable.user_id && @comment.user_id != @comment.parent.user_id)
          # 댓글 == 게시글 작성자 && 댓글 != 대댓글 작성자 => 대댓글 작성자에게 알림이 발송
          @new_notification = NewNotification.create! user: @comment.parent.user,
                                                    content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                    link: request.referrer
          
                                                    
        elsif (@comment.parent_id != nil && @comment.parent_id == @comment.parent.id)
          @comment.parent.children.each do |x|
            if (@comment.user_id != x.user_id && @comment.user_id != x.parent.user_id )# 자기 자신에겐 알림 메세지가 안가게
              @new_notification5 = NewNotification.create! user: x.user,
                                                          content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                          link: request.referrer
            end
          end
        end
        
        if (@comment.parent_id != nil && @comment.user_id == commentable.user_id && @comment.user_id != @comment.parent.user_id)
          @comment.parent.children.each do |x|
            if (@comment.user_id != x.user_id || x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
              @new_notification5 = NewNotification.create! user: x.user,
                                                          content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                          link: request.referrer
            elsif (@comment.user_id != x.user_id && x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
              @new_notification5 = NewNotification.create! user: x.user,
                                                          content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                          link: request.referrer
            end
          end
        end
        
        if (@comment.parent_id != nil && @comment.user_id == commentable.user_id && @comment.user_id == @comment.parent.user_id)
          @comment.parent.children.each do |x|
            if (@comment.user_id != x.user_id || x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
              @new_notification5 = NewNotification.create! user: x.user,
                                                          content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                          link: request.referrer
            elsif (@comment.user_id != x.user_id && x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
              @new_notification5 = NewNotification.create! user: x.user,
                                                          content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                          link: request.referrer
            end
          end
        end
        
        if (@comment.parent_id != nil && @comment.parent.user_id == commentable.user_id)
          @comment.parent.children.each do |x|
            if (@comment.user_id != x.user_id && @comment.user_id != x.parent.user_id )# 자기 자신에겐 알림 메세지가 안가게
              @new_notification5 = NewNotification.create! user: x.user,
                                                          content: "#{current_user.name.truncate(15, omission: '...')} 님의 댓글도착  /  ",
                                                          link: request.referrer
            end
          end
        end
        
        @comment.save
      else
        format.html  { redirect_to(request.referrer, :alert => '댓글 내용을 작성해주세요.') }
      end
    end
  end
 
  def destroy
      @comment = Comment.find_by(id: params[:id])
      @comment.delete
      respond_to do |format|
        format.html { redirect_to(request.referrer, :notice => '댓글이 삭제되었습니다.')}
        format.js
      end
  end
 
  private
 
  def comment_params
    params[:comment][:name] = current_user.email
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id, :user_id, :name)
  end
 
  def commentable_type
    comment_params[:commentable_type]
  end
 
  def commentable_id
    comment_params[:commentable_id]
  end
 
  def comment_id
    comment_params[:comment_id]
  end
 
  def body
    comment_params[:body]
  end
 
  def make_child_comment
    return "" if comment_id.blank?
 
    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end
end