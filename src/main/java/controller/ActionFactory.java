package controller;

import controller.action.Action;
import controller.action.AllArticleViewAction;
import controller.action.ArticleDetailViewAction;
import controller.action.DeleteArticleAction;
import controller.action.LogoutAction;
import controller.action.RegisterAccountAction;
import controller.action.UpdateArticleAction;
import controller.action.UpdateFormArticleAction;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory(){}
	
	public static ActionFactory getInstance(){
		return instance;
	}
	
	public Action getAction(String command){ //list
		Action action = null;
		
		if(command.equals("board")){
			action = new AllArticleViewAction();
		}else if(command.equals("article_detail")){ 
			action = new ArticleDetailViewAction();
		}else if(command.equals("register")){ 
			action = new RegisterAccountAction();
		}else if(command.equals("updateForm")){ 
			action = new UpdateFormArticleAction();
		}else if(command.equals("update")){ 
			action = new UpdateArticleAction();
		}else if(command.equals("delete")){ 
			action = new DeleteArticleAction();
		}else if(command.equals("register")){ 
			action = new RegisterAccountAction();
		}else if(command.equals("logout")){ 
			action = new LogoutAction();
		}

		return action;
	}
}

