% ii io
reverse([],[]).
reverse([W|X],Y):-reverse(X,Z),append(Z,[W],Y).