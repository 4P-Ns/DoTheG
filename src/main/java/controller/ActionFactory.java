package controller;

import controller.action.Action;
import controller.action.AllArticleViewAction;
import controller.action.ArticleDetailViewAction;
import controller.action.DeleteArticleAction;
import controller.action.RegisterAccountAction;
import controller.action.UpdateArticleAction;
import controller.action.UpdateFormArticleAction;
import controller.action.UpdateFormBoardAction;
import controller.action.WriteArticleAction;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory(){}
	
	public static ActionFactory getInstance(){
		return instance;
	}
	
	public Action getAction(String command){ //list
		Action action = null;
		
//		if(command.equals("main")){	 	
//			action = new MainPageAction();
//		}else if(command.equals("lecture")){  
//			action = new LectureViewAction();
//		}else if(command.equals("write")){ 
//			action = new WriteArticleAction();
//		}else if(command.equals("board")){
//			action = new AllArticleViewAction();
//		}else if(command.equals("article_detail")){ 
//			action = new ArticleDetailViewAction();
//		}else if(command.equals("update")){ 
//			action = new UpdateArticleAction();
//		}else if(command.equals("delete")){ 
//			action = new DeleteArticleAction();
//		}
		
		if(command.equals("board")){
			action = new AllArticleViewAction();
		}else if(command.equals("article_detail")){ 
			action = new ArticleDetailViewAction();
			
		}else if(command.equals("updateForm")){ 
			action = new UpdateFormArticleAction();
		}else if(command.equals("update")){ 
			action = new UpdateArticleAction();
		}else if(command.equals("delete")){ 
			action = new DeleteArticleAction();
		}else if(command.equals("register")){ 
			action = new RegisterAccountAction();
		}

		return action;
	}
}

