package org.strategoxt.imp.runtime.dynamicloading;

import static org.strategoxt.imp.runtime.dynamicloading.TermReader.*;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.imp.services.IReferenceResolver;
import org.spoofax.interpreter.terms.IStrategoAppl;
import org.strategoxt.imp.runtime.services.NodeMapping;
import org.strategoxt.imp.runtime.services.StrategoObserver;
import org.strategoxt.imp.runtime.services.StrategoReferenceResolver;

/**
 * @author Lennart Kats <lennart add lclnet.nl>
 */
public class ReferenceResolverFactory extends AbstractServiceFactory<IReferenceResolver> {
	
	@Override
	public Class<IReferenceResolver> getCreatedType() {
		return IReferenceResolver.class;
	}
	
	@Override
	public IReferenceResolver create(Descriptor descriptor) throws BadDescriptorException {
		IStrategoAppl descriptorFile = descriptor.getDocument();
		StrategoObserver feedback = descriptor.getStrategoObserver();
		
		List<NodeMapping<String>> resolverFunctions = new ArrayList<NodeMapping<String>>();
		List<NodeMapping<String>> helpFunctions = new ArrayList<NodeMapping<String>>();
		
		for (IStrategoAppl rule : collectTerms(descriptorFile, "ReferenceHoverRule")) {
			resolverFunctions.add(NodeMapping.create(termAt(rule, 0), termContents(termAt(rule, 1))));
			helpFunctions.add(NodeMapping.create(termAt(rule, 0), termContents(termAt(rule, 2))));
		}
		
		for (IStrategoAppl rule : collectTerms(descriptorFile, "ReferenceRule")) {
			resolverFunctions.add(NodeMapping.create(termAt(rule, 0), termContents(termAt(rule, 1))));
		}
		
		for (IStrategoAppl rule : collectTerms(descriptorFile, "HoverRule")) {
			helpFunctions.add(NodeMapping.create(termAt(rule, 0), termContents(termAt(rule, 1))));
		}
		
		return new StrategoReferenceResolver(feedback, resolverFunctions, helpFunctions);
	}
}
