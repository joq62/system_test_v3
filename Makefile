all:
#	service
	rm -rf *.beam test_src/*.beam test_ebin;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf cluster support host_config;
	echo Done
doc_gen:
	echo glurk not implemented
test:
	rm -rf *.beam test_src/*.beam test_ebin;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf cluster support host_config;
#	support
	git clone https://github.com/joq62/support.git
#	cluster
	git clone https://github.com/joq62/cluster.git
#	service
#	test application
	mkdir test_ebin;
	cp test_src/*.app test_ebin;
	erlc -o test_ebin test_src/*.erl;
	erl -pa test_ebin\
	    -pa */ebin\
	    -setcookie abc\
	    -sname test_service\
	    -run unit_test start_test test_src/test.config
