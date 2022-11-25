#include "DUCROT_LACHENY-component.hpp"
#include <rtt/Component.hpp>
#include <iostream>

DUCROT_LACHENY::DUCROT_LACHENY(std::string const& name) : TaskContext(name){
  std::cout << "DUCROT_LACHENY constructed !" <<std::endl;
}

bool DUCROT_LACHENY::configureHook(){
  std::cout << "DUCROT_LACHENY configured !" <<std::endl;
  return true;
}

bool DUCROT_LACHENY::startHook(){
  std::cout << "DUCROT_LACHENY started !" <<std::endl;
  return true;
}

void DUCROT_LACHENY::updateHook(){
  std::cout << "DUCROT_LACHENY executes updateHook !" <<std::endl;
}

void DUCROT_LACHENY::stopHook() {
  std::cout << "DUCROT_LACHENY executes stopping !" <<std::endl;
}

void DUCROT_LACHENY::cleanupHook() {
  std::cout << "DUCROT_LACHENY cleaning up !" <<std::endl;
}

/*
 * Using this macro, only one component may live
 * in one library *and* you may *not* link this library
 * with another component library. Use
 * ORO_CREATE_COMPONENT_TYPE()
 * ORO_LIST_COMPONENT_TYPE(DUCROT_LACHENY)
 * In case you want to link with another library that
 * already contains components.
 *
 * If you have put your component class
 * in a namespace, don't forget to add it here too:
 */
ORO_CREATE_COMPONENT(DUCROT_LACHENY)
