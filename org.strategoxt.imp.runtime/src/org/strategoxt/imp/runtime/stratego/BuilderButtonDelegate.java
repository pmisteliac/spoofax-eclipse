package org.strategoxt.imp.runtime.stratego;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.runtime.Status;
import org.eclipse.jface.action.Action;
import org.eclipse.jface.action.ActionContributionItem;
import org.eclipse.jface.action.IAction;
import org.eclipse.jface.dialogs.ErrorDialog;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.IWorkbenchWindowPulldownDelegate;
import org.strategoxt.imp.runtime.EditorState;
import org.strategoxt.imp.runtime.Environment;
import org.strategoxt.imp.runtime.dynamicloading.BadDescriptorException;
import org.strategoxt.imp.runtime.services.IBuilder;
import org.strategoxt.imp.runtime.services.IBuilderMap;

/**
 * Implements a dropdown button with builder actions.
 * 
 * @author Lennart Kats <lennart add lclnet.nl>
 */
public class BuilderButtonDelegate extends AbstractHandler implements IWorkbenchWindowPulldownDelegate {
	
	// TODO: IWorkbenchWindowPulldownDelegate?
	
	private static String lastAction;
	
	private Menu menu;

	public void init(IWorkbenchWindow window) {
		// Initialized using getMenu()
	}

	public void run(IAction action) {
		EditorState editor = EditorState.getActiveEditor();
		if (editor == null) return;
		
		IBuilderMap builders = getBuilders(editor);
		IBuilder builder = builders.get(lastAction);
		if (builder == null && builders.getAll().size() > 0) {
			builder = builders.getAll().iterator().next();
		}
		if (builder != null)
			builder.execute(editor, null);
	}

	public Object execute(ExecutionEvent event) throws ExecutionException {
		run(null);
		return null;
	}
	
	public void selectionChanged(IAction action, ISelection selection) {
		// Unused
	}
		
	private void populateMenu(Menu menu) {
		MenuItem dummy = new MenuItem(menu, SWT.PUSH);
		dummy.setText("No builders defined for this editor");
		
		final EditorState editor = EditorState.getActiveEditor();
		if (editor == null) return;
		
		IBuilderMap builders = getBuilders(editor);
		if (builders.getAll().size() == 0) return;
		
		for (final IBuilder builder : builders.getAll()) {
			IAction action = new Action(builder.getCaption()) {
				@Override
				public void run() {
					lastAction = builder.getCaption();
					builder.execute(editor, null);
				}
			};
			ActionContributionItem item = new ActionContributionItem(action);
			// item.fill(menu, Action.AS_PUSH_BUTTON);
			item.fill(menu, menu.getItemCount());
		}
		
		dummy.dispose();
	}

	private IBuilderMap getBuilders(EditorState editor) {
		IBuilderMap builders;
		try {
			builders = editor.getDescriptor().createService(IBuilderMap.class);
		} catch (BadDescriptorException e) {
			Environment.logException("Could not load builder", e);
			// TODO: fix error dialog not showing?
			ErrorDialog.openError(editor.getEditor().getSite().getShell(),
					"Spoofax/IMP building", "Could not load builders", Status.OK_STATUS);
			throw new RuntimeException(e);
		}
		return builders;
	}
		
	@Override
	public void dispose() {
		if (menu != null) {
			menu.dispose();
			menu = null;
		}
		super.dispose();
	}

	public Menu getMenu(Control parent) {
		if (menu != null) {
			menu.dispose();
		}
		menu = new Menu(parent);
		populateMenu(menu);
		return menu;
	}

}